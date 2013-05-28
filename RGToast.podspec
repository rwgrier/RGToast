#
# Be sure to run `pod spec lint RGToast.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "RGToast"
  s.version      = "0.0.1"
  s.summary      = "A small library to provide a toast functionality."
  s.license 	 = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = "https://github.com/rwgrier/RGToast"
  s.author       = { "Ryan Grier" => "rwgrier@gmail.com" }
  s.source       = { :git => "https://github.com/rwgrier/RGToast.git", :commit => "3929b3621ad2d2685b26c81b82810f50c4a6d6c2" }
  s.platform     = :ios
  s.source_files = 'RGToast/*.{h,m}'
  s.requires_arc = true
end
