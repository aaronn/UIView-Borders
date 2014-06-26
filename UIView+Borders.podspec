Pod::Spec.new do |s|
  s.name             = "UIView+Borders"
  s.version          = "0.1.0"
  s.summary          = "Easy one-sided and offset borders on all UIViews."
  s.description      = <<-DESC
# UIView+Borders

**Add borders to everything!** A quick and simple UIView category to add one-sided borders to your UIViews. Supports both layer-backed borders and UIView backed borders, if layers aren't possible. Supports one-sided borders with offset amounts for top, right, bottom and left sides!

                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/UIView+Borders"
  s.license          = 'MIT'
  s.author           = { "Christian Sampaio" => "christian.fsampaio@gmail.com" }
  s.source           = { :git => "https://github.com/chrisfsampaio/UIView+Borders.git", :tag => '0.1.0' }
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes'
  s.resources = 'Pod/Assets/*.png'

end
