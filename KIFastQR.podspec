Pod::Spec.new do |s|
  s.name         = "KIFastQR"
  s.version      = "0.2.0"
  s.summary      = "Really easy QR decoding."
  s.description  = "Really easy & fast QR decoding. Only 3 lines to integrate."
  s.homepage     = "https://github.com/kaiinui/FastQR"
  s.license      = "MIT"
  s.author       = { "kaiinui" => "lied.der.optik@gmail.com" }
  s.source       = { :git => "https://github.com/kaiinui/FastQR.git", :tag => "v0.2.0" }
  s.source_files  = "FastQR/Classes/**/*.{h,m}"
  #s.exclude_files = "Classes/Exclude"
  s.requires_arc = true
  s.platform = "ios", '7.0'
end

