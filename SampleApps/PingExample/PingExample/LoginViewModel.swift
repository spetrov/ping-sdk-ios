//
//  DavinciViewModel.swift
//  PingExample
//
//  Copyright (c) 2024 Ping Identity. All rights reserved.
//
//  This software may be modified and distributed under the terms
//  of the MIT license. See the LICENSE file for details.
//

import Foundation
import SwiftUI
import Observation
import PingDavinci
import PingOidc
import PingOrchestrate

class LoginViewModel: ObservableObject {
    
    @Published public var isLoading: Bool = false
  
    @ObservedObject var davinciViewModel: DavinciViewModel
    
    
    init(
         isLoading: Bool = false,
         davinciViewModel: DavinciViewModel) {
       
        self.isLoading = isLoading
        self.davinciViewModel = davinciViewModel
    }
    
    public func next() async {
        isLoading = true
        if let nextNode = davinciViewModel.data.currentNode as? ContinueNode  {
            await davinciViewModel.next(node: nextNode)
            isLoading = false
        }
    }
    
}

