Pod::Spec.new do |spec|

  spec.name         = "Crypttp"
  spec.version      = "0.0.1"
  spec.summary      = "Library to work with Crypttp."
  spec.description  = "For documetation of the library go to the project URL: https://github.com/Crypttp/crypttp-ios-sdk"

  spec.homepage     = "https://github.com/Crypttp/crypttp-ios-sdk"
  spec.license      = "MIT"
  spec.author             = { "Maxim Mamedov" => "" }
  spec.platform     = :ios, "11.0"
  spec.source       = { :git => "https://github.com/Crypttp/crypttp-ios-sdk.git", :tag => "#{spec.version}" }
  spec.source_files  = "CrypttpFramework/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
  spec.swift_version = "5.0"

end
