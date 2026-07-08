
Pod::Spec.new do |s|
  s.name         = "Slideshow"
  s.version      = "1.0.0"
  s.summary      = "An infinitely scrolling pagination control."
  s.homepage     = "https://github.com/sul/Slideshow"
  s.license      = "MIT"
  s.authors      = { "liuchang" => "iliuchang@foxmail.com" }
  s.platform     = :ios, "11.0"
  s.source       = { :git => "https://github.com/sul/Slideshow.git", :tag => s.version }
  s.swift_version = "5.0"
  s.requires_arc = true
  s.source_files = "Sources/*.{swift}"
  s.resource_bundles = { 'Slideshow' => ['Sources/PrivacyInfo.xcprivacy'] }
end
