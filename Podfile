platform :ios, '13.0'

use_frameworks!

workspace 'handika-poke-app'

def core_pod
  target 'Common' do
    project 'cores/Common/Common.xcodeproj'
  end
  
  target 'Components' do
    project 'cores/Components/Components.xcodeproj'
  end
  
  target 'Networking' do
    project 'cores/Networking/Networking.xcodeproj'
  end
  
  target 'RouterServiceInterface' do
    project 'cores/RouterServiceInterface/RouterServiceInterface.xcodeproj'
  end
  
  target 'RouterService' do
    project 'cores/RouterService/RouterService.xcodeproj'
  end

end

def shared_pod
end

def features_pod
end

target 'handika-poke-app' do
  shared_pod
  core_pod
  features_pod
  
  target 'handika-poke-appTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['ENABLE_BITCODE'] = 'NO'
      end
    end
  end
  
end
