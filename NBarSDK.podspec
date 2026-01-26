Pod::Spec.new do |s|
  s.name             = 'NBarSDK'
  s.version          = '1.0.0'
  s.summary          = 'NBarSDK'

  s.description      = 'NBarSDK is a barcode scanning SDK for iOS applications.'

  s.homepage         = 'https://github.com/kartel/NBarSDK.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kartel' => 'neilliga@gmail.com' }
  s.source           = { :git => 'https://github.com/kartel/NBarSDK.git', :tag => '1.0.0'}

  s.ios.deployment_target = '13.0'

  # Expose only the public iOS SDK headers (+ zbar.h which they import)
  s.public_header_files = ['iphone/*.h', 'iphone/**/*.h', 'iphone/**/**/*.h', 'include/*.h']

  # Precisely include sources to avoid overlapping/duplicate matches
  s.source_files = [
    "include/zbar.h",
    "zbar/**/*.h",
    "iphone/*.h",
    "iphone/include/**/*.h",
    "zbar/{config,decoder,error,image,img_scanner,refcnt,scanner,symbol}.c",
    "zbar/decoder/{codabar,code39,code93,code128,databar,ean,i25,qr_finder}.c",
    "zbar/qrcode/*.c",
    "iphone/*.m"
  ]
  # # Private headers needed during build (eg, config.h)
  # s.private_header_files = ['iphone/include/config.h']
  
  # Bundle SDK resources (HTML and images)
  s.resource_bundles = {
    'NBarSDKResources' => ['iphone/res/*']
  }

  s.frameworks = ['AVFoundation', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'QuartzCore', 'WebKit']
  s.libraries = 'iconv'
  s.prefix_header_file = 'iphone/include/prefix.pch'
  s.requires_arc = false
  s.compiler_flags = '-w -I"$(PODS_TARGET_SRCROOT)/iphone/include" -I"$(PODS_TARGET_SRCROOT)/include" -I"$(PODS_TARGET_SRCROOT)/zbar"'

  # Merge xcconfig settings to avoid overriding keys
  s.pod_target_xcconfig = {
    'EXCLUDED_SOURCE_FILE_NAMES[sdk=iphoneos*][arch=*]' => 'ZBarReaderViewImpl_Simulator.m',
    'EXCLUDED_SOURCE_FILE_NAMES[sdk=iphonesimulator*][arch=*]' => 'ZBarReaderViewImpl_Capture.m ZBarCaptureReader.m',
    'GCC_PREPROCESSOR_DEFINITIONS' => 'NDEBUG=1',
    # Ensure zbar.h and config.h are discoverable
    'HEADER_SEARCH_PATHS' => '$(inherited) $(PODS_TARGET_SRCROOT)/iphone/include $(PODS_TARGET_SRCROOT)/include $(PODS_TARGET_SRCROOT)/zbar',
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(PODS_TARGET_SRCROOT)/iphone/include $(PODS_TARGET_SRCROOT)/include $(PODS_TARGET_SRCROOT)/zbar'
  }
end
