Pod::Spec.new do |s|
  s.name         = "UIView+Borders"
  s.version      = "0.0.1"
  s.summary      = "Add borders to every UIView!"
  s.description  = "A quick and simple UIView category to add one-sided borders to your UIViews. Supports both layer-backed borders and UIView backed borders, if layers aren't possible. Supports one-sided borders with offset amounts for top, right, bottom and left sides!"
  s.homepage     = "https://github.com/aaronn/UIView-Borders"
  s.license      = { :type => 'BSD', :text => 'UIView+Borders is licensed under the BSD license.'}
  s.author             = { "aaronykng" => "hi@aaron.ng" }
  s.social_media_url   = "http://twitter.com/aaronykng"
  s.source       = { :git => "https://github.com/aaronn/UIView-Borders.git", :tag => "0.0.1" }
  s.source_files  = "UIView+Borders.{h,m}"
  s.platform     = :ios
end
