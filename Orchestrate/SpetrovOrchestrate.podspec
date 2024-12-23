#
# Be sure to run `pod lib lint Orchestrate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SpetrovOrchestrate'
  s.version          = '2.1.0-beta1'
  s.summary          = 'Orchestrate SDK for iOS'
  s.description      = <<-DESC
  The Orchestrate SDK provides a simple way to build a state machine for ForgeRock Journey and PingOne DaVinci.
                       DESC
  s.homepage         = 'https://www.pingidentity.com/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Ping Identity'

  s.source           = {
      :git => 'https://github.com/spetrov/ping-orchestrate-spetrov.git',
      :tag => s.version.to_s
  }

  s.module_name   = 'SpetrovOrchestrate'
  s.swift_versions = ['5.0', '5.1']

  s.ios.deployment_target = '13.0'

  base_dir = "Orchestrate"
  s.source_files = base_dir + '/**/*.swift', base_dir + '/**/*.h'
  s.resource_bundles = {
    'Orchestrate' => [base_dir + '/*.xcprivacy']
  }
  
  s.ios.dependency 'SpetrovLogger', '~> 1.9.0-beta1'
  s.ios.dependency 'SpetrovStorage', '~> 2.0.0-beta1'
end
