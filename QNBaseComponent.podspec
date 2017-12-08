#
# Be sure to run `pod lib lint QNBaseComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QNBaseComponent'
  s.version          = '0.5.0'
  s.summary          = 'QNBaseComponent'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  QNBaseComponent 【组件化开发】【基础组件】【配置组件】【分类组件】【工具组件】【网络请求组件】【日期：2017/11/24】
                       DESC

  s.homepage         = 'https://github.com/shuaijianjian/QNBaseComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shuaijianjian' => 'zhoujianjian@channelsoft.com' }
  s.source           = { :git => 'https://github.com/shuaijianjian/QNBaseComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  # s.source_files = 'QNBaseComponent/Classes/**/*'

  s.subspec 'QNBasicConfiguration' do |b|
    b.source_files = 'QNBaseComponent/Classes/QNBasicConfiguration/**/*'
  end

  s.subspec 'QNCategory' do |c|
   c.source_files = 'QNBaseComponent/Classes/QNCategory/**/*'
  end

  s.subspec 'QNTool' do |t|
    t.source_files = 'QNBaseComponent/Classes/QNTool/**/*'
  end

  s.subspec 'QNNetwork' do |n|
    n.source_files = 'QNBaseComponent/Classes/QNNetwork/**/*'
    n.dependency 'AFNetworking', '~> 3.1.0'
  end


  # s.resource_bundles = {
  #   'QNBaseComponent' => ['QNBaseComponent/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end
