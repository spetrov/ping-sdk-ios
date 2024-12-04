#
# Be sure to run `pod lib lint Oidc.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SpetrovOidc'
  s.version          = '2.9.0-beta2'
  s.summary          = 'Oidc SDK for iOS'
  s.description      = <<-DESC
  The Oidc SDK provides OIDC client for PingOne and ForgeRock platform..
                       DESC
  s.homepage         = 'https://www.pingidentity.com/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Ping Identity'

  s.source           = {
      :git => 'https://github.com/spetrov/ping-oidc-spetrov.git',
      :tag => s.version.to_s
  }

  s.module_name   = 'PingOidc'
  s.swift_versions = ['5.0', '5.1']

  s.ios.deployment_target = '13.0'

  base_dir = "Oidc/Oidc"
  s.source_files = base_dir + '/**/*.swift', base_dir + '/**/*.h'
  s.resource_bundles = {
    'Oidc' => [base_dir + '/*.xcprivacy']
  }
  
  s.ios.dependency 'PingOrchestrate', '~> 2.1.0-beta1'
end
