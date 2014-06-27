require 'wrappium'

settings = { platformName: 'iOS', versionNumber: '7.1', app:  '../build/Release-iphonesimulator/SayHello.app' }

run_appium_ios(settings) do |driver|
  input = driver.find_element(:name, 'sayName')
  input.send_keys('World')

  say_it = driver.find_element(:name, 'sayButton')
  say_it.click

  said = driver.find_element(:name, 'sayLabel')

  puts said.text
end
