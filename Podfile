source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'

target 'DriveTime' do

  use_frameworks!
  
  # Networking libraries
  pod 'Alamofire', '~> 4.7'
  pod 'AlamofireObjectMapper', '~> 5.0'
  
  # Form and sign up menus
  pod 'Eureka', '~> 4.2.0'
  pod 'ImageRow', '~> 3.0'
  
  # TextfieldEffect
  pod 'TextFieldEffects', '~> 1.4.0'
  
  # SwifyBeaver for logging
  pod 'SwiftyBeaver'
  
  # Loading indicator
  pod 'NVActivityIndicatorView'
  
  post_install do |installer|
      installer.pods_project.build_configurations.each do |config|
          config.build_settings.delete('CODE_SIGNING_ALLOWED')
          config.build_settings.delete('CODE_SIGNING_REQUIRED')
      end
  end

  target 'DriveTimeTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'DriveTimeUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
