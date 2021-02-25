#
# Be sure to run `pod lib lint MobileiaCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MobileiaCore'
  s.version          = '0.1.1'
  s.swift_version    = '5.0'
  s.summary          = 'Libreria Core para MobileIA'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Esta la base para todos los proyectos y librerias que son creados por MobileIA!
                       DESC

  s.homepage         = 'https://github.com/Braintly/mia-core-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license           = { :type => "Apache License 2.0", :file => "LICENSE" }
  s.author            = { "Matias Camiletti" => "matias.camiletti@gmail.com" }
  s.source            = { :git => "https://github.com/Braintly/mia-core-ios.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'MobileiaCore/**/*'
  
  # s.resource_bundles = {
  #   'MobileiaCore' => ['MobileiaCore/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency "PureLayout", '~> 3.1.6'
  s.dependency "RealmSwift", '~> 10.0.0'
  s.dependency "Alamofire", '~> 5.3.0'
  s.dependency "AlamofireImage", '~> 4.1.0'
end
