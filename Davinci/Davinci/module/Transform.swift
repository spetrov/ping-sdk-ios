//
//  Transform.swift
//  Davinci
//
//  Copyright (c) 2024 Ping Identity. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//


import Foundation
import SpetrovOidc
import SpetrovOrchestrate

/// Module for transforming the response from DaVinci to `Node`.
public class NodeTransformModule {
  
  public static let config: Module<Void> = Module.of(setup: { setup in
    setup.transform { flowContext, response in
      let status = response.status()
      
      let json = try response.json(data: response.data)
      
      let message = json[Constants.message] as? String ?? ""
      let body = response.body()
      
      // Check for 4XX errors that are unrecoverable
      if (400..<500).contains(status) {
        // Filter out client-side "timeout" related unrecoverable failures
        if json[Constants.code] as? Int == Constants.code_1999 || json[Constants.code] as? String == Constants.requestTimedOut {
          return FailureNode(cause: ApiError.error(status, json, body))
        }
        
        // Filter our "PingOne Authentication Connector" unrecoverable failures
        if let connectorId = json[Constants.connectorId] as? String, connectorId == Constants.pingOneAuthenticationConnector,
           let capabilityName = json[Constants.capabilityName] as? String,
           [Constants.returnSuccessResponseRedirect, Constants.setSession].contains(capabilityName) {
          return FailureNode(cause: ApiError.error(status, json, body))
        }
        
        // If we're still here, we have a 4XX failure that should be recoverable
        return ErrorNode(status: status, input: json, message: message)
      }
      
      // Handle success (2XX) responses
      if status == 200 {
        // Filter out 2XX errors with 'failure' status
        if let failedStatus = json[Constants.status] as? String, failedStatus == Constants.FAILED {
          return FailureNode(cause: ApiError.error(status, json, body))
        }
        
        // Filter out 2XX errors with error object
        if let error = json[Constants.error] as? [String: Any], !error.isEmpty {
          return FailureNode(cause: ApiError.error(status, json, body))
        }
        
        return transform(context: flowContext, davinci: setup.workflow, json: json)
      }
      
      // 5XX errors are treated as unrecoverable failures
      return FailureNode(cause: ApiError.error(status, json, body))
    }
    
  })
  
  private static func transform(context: FlowContext, davinci: DaVinci, json: [String: Any]) -> Node {
    // If authorizeResponse is present, return success
    if let _ = json[Constants.authorizeResponse] as? [String: Any] {
      return SuccessNode(input: json, session: SessionResponse(json: json))
    }
    
    var collectors: Collectors = []
    if let _ = json[Constants.form] {
      collectors.append(contentsOf: Form.parse(json: json))
    }
    
    return Connector(context: context, davinci: davinci, input: json, collectors: collectors)
  }
}

struct SessionResponse: Session {
  public let json: [String: Any]
  
  public init(json: [String: Any] = [:]) {
    self.json = json
  }
  
  var value: String {
    get {
      let authResponse = json[Constants.authorizeResponse] as? [String: Any]
      return authResponse?[Constants.code] as? String ?? ""
    }
  }
  
}

public enum ApiError: Error {
  case error(Int, [String: Any], String)
}
