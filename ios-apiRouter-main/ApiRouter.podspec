Pod::Spec.new do |s|
  s.name = 'ApiRouter'
  s.version = '1.0.5'
  s.authors = 'Prisma Media'
  s.summary = 'Api Router is a simple protocol to quickly connect an API.'
  s.homepage = 'https://github.com/prismamedia/ios-apiRouter'
  s.license = 'BSD 3'
  
  s.platform = :ios
  s.ios.deployment_target = '12.0'
  
  s.source = { :git => 'https://github.com/prismamedia/ios-apiRouter.git', :tag => s.version.to_s }
  s.swift_version = '5.0'
  
  s.requires_arc = true
  s.frameworks = 'Foundation'
  s.frameworks = 'UIKit'
  
  s.source_files = 'Sources/**/*.swift'
  s.dependency 'Alamofire', '~> 5'
end
