
Pod::Spec.new do |s|
  s.name         = "Fresh"
  s.version      = "1.0.4"
  s.summary      = 'Base object for iOS'
  s.homepage     = "https://github.com/GodL/Fresh.git"
  s.license      = "MIT"
  s.author       = { "GodL" => "547188371@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/GodL/Fresh.git", :tag => s.version.to_s }
  s.framework  = "UIKit"
  s.requires_arc = true

  s.subspec 'Marco' do |ss|
  ss.source_files = 'Fresh/Marco/*.h'
  end

  s.subspec 'Service' do |ss|
  ss.dependency 'YYModel'
  ss.dependency 'AFNetworking'
  ss.dependency 'StreamKit'
  ss.source_files = 'Fresh/Service/*.{h,m}'
  end

  s.subspec 'Category' do |ss|
  ss.dependency 'MJRefresh'
  ss.dependency 'StreamKit'
  ss.dependency 'Masonry'
  ss.source_files = 'Fresh/Category/*.{h,m}'
  end

  s.subspec 'ViewModel' do |ss|
  ss.dependency 'StreamKit'
  ss.public_header_files = 'Fresh/ViewModel/*.h'
  ss.source_files = 'Fresh/ViewModel/*.{h,m}'
  end

  s.subspec 'Model' do |ss|
  ss.source_files = 'Fresh/Model/*.{h,m}'
  end

  s.subspec 'View' do |ss|
  ss.dependency 'Masonry'
  ss.source_files = 'Fresh/View/*.{h,m}'
  end

  s.subspec 'Controller' do |ss|
  ss.dependency 'Masonry'
  ss.dependency 'StreamKit'
  ss.source_files = 'Fresh/Controller/*.{h,m}'
  end
end
