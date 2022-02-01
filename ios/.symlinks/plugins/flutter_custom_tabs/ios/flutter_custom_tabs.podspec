#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_custom_tabs'
  s.version          = '0.0.1'
  s.summary          = 'A Flutter plugin to use Chrome Custom Tabs.'
  s.description      = <<-DESC
A Flutter plugin to use Chrome Custom Tabs.
                       DESC
  s.homepage         = 'https://github.com/droibit/flutter_custom_tabs'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'roomful.rooms@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  s.ios.deployment_target = '8.0'
end
