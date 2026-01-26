Pod::Spec.new do |s|
  s.name             = 'NBarSDK'
  s.version          = '1.0.0'
  s.summary          = 'NBarSDK'

  s.description      = 'NBarSDK is a barcode scanning SDK for iOS applications.'

  s.homepage         = 'https://github.com/kartel/NBarSDK.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kartel' => 'neilliga@gmail.com.com' }
  s.source           = { :git => 'https://github.com/kartel/NBarSDK.git', :tag => '1.0.0'}

  s.ios.deployment_target = '9.0'

  s.public_header_files = ['iphone/**/*.h', 'include/**/*.h']

  s.source_files = ['include/**/*', 'zbar/**/*', 'iphone/**/*']
  
  # s.resource_bundles = {
  #   'NBarSDK' => ['NBarSDK/Assets/*.png']
  # }

  s.frameworks = ['AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'QuartzCore']
  s.libraries = 'iconv'
  s.prefix_header_file = 'iphone/include/prefix.pch'
  s.requires_arc = false
  s.compiler_flags = '-w'
  s.xcconfig = {'EXCLUDED_SOURCE_FILE_NAMES[sdk=iphoneos*][arch=*]' => 'ZBarReaderViewImpl_Simulator.m' }
  s.xcconfig = {'EXCLUDED_SOURCE_FILE_NAMES[sdk=iphonesimulator*][arch=*]' => 'ZBarReaderViewImpl_Capture.m ZBarCaptureReader.m' }
  s.xcconfig = {'GCC_PREPROCESSOR_DEFINITIONS' => 'NDEBUG=1' }
end