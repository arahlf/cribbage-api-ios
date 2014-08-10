
Pod::Spec.new do |s|

  s.name         = "cribbage-api-ios"
  s.version      = "0.3.0"
  s.summary      = "CribbageAPI is a simple utility for scoring hands in Cribbage."
  s.homepage     = "https://github.com/arahlf/cribbage-api-ios"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "arahlf" => "arahlf@gmail.com" }

  s.source       = { :git => "https://github.com/arahlf/cribbage-api-ios.git", :tag => "0.3.0" }
  s.source_files = "CribbageAPI/**/*.{h,m}"

  s.requires_arc = true

end
