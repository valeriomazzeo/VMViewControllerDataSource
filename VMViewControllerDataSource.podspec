Pod::Spec.new do |s|
  s.name             = "VMViewControllerDataSource"
  s.version          = "0.1.0"
  s.summary          = "The VMViewControllerDataSource class implements a specialized datasource object that renders reusable UIViewController object instead of cells objects."
  s.homepage         = "https://github.com/valeriomazzeo/VMViewControllerDataSource"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Valerio Mazzeo" => "valerio.mazzeo@gmail.com" }
  s.source           = { :git => "https://github.com/valeriomazzeo/VMViewControllerDataSource", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  
  s.frameworks = 'UIKit'
end