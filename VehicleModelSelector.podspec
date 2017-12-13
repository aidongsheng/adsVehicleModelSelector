#
# Be sure to run `pod lib lint VehicleModelSelector.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VehicleModelSelector'
  s.version          = '1.0.0'
  s.summary          = '车辆型号选择组件'



  s.description      = <<-DESC
TODO: Add long description of the pod here.

                       DESC

  s.homepage         = 'https://github.com/aidongsheng/adsVehicleModelSelector'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '18606563661@163.com' => 'coding_ai@qq.com' }
  s.source           = { :git => 'https://github.com/aidongsheng/adsVehicleModelSelector.git', :tag => s.version }

  s.ios.deployment_target = '10.0'

  s.source_files = 'VehicleModelSelector/Classes/**/*'
  
   s.resource_bundles = {
     'VehicleModelSelector' => ['VehicleModelSelector/Assets/**/*']
   }

   s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  # 猿题库基于 AFNetworking 封装的网络工具
   s.dependency 'YTKNetwork'
  # 集成 QMUI 模板
   s.dependency 'QMUIKit'
  # 集成 tableview 头部底部刷新组件
   s.dependency 'MJRefresh'
  # 集成布局框架 Masonry
   s.dependency 'Masonry'
  # YYKit 工具库
   s.dependency 'YYKit'
end
