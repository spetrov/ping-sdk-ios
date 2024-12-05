#
# Be sure to run `pod lib lint Storage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SpetrovStorage'
  s.version          = '2.0.0-beta1'
  s.summary          = 'Storage SDK for iOS'
  s.description      = <<-DESC
  The Storage SDK provides a flexible storage interface and a set of common storage solutions for the Ping SDKs.
                       DESC
  s.homepage         = 'https://www.pingidentity.com/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = 'Ping Identity'

  s.source           = {
      :git => 'https://github.com/spetrov/ping-storage-spetrov.git',
      :tag => s.version.to_s
  }

  s.module_name   = 'SpetrovStorage'
  s.swift_versions = ['5.0', '5.1']

  s.ios.deployment_target = '13.0'

  base_dir = "Storage"
  s.source_files = base_dir + '/**/*.swift', base_dir + '/**/*.c', base_dir + '/**/*.h'
  s.resource_bundles = {
    'Storage' => [base_dir + '/*.xcprivacy']
  }
end
