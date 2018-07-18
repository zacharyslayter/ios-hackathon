platform :ios, '10.0'
use_frameworks!

target 'Hackathon' do
    pod 'Alamofire', '~> 4.7.2'
    pod 'SwiftyJSON', '~> 4.1.0'
    pod ‘ApiAI’

  target 'HackathonTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'HackathonUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        if config.name == 'Release'
            config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
            else
            config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
        end
    end
end
