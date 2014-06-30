require 'wrappium'

settings = { platformName: 'iOS', versionNumber: '7.1', app:  '../build/Release-iphonesimulator/SayHello.app' }

driver = start_appium_ios_driver(settings)

input = driver.find_element(:name, 'sayName')
input.send_keys('World')

say_it = driver.find_element(:name, 'sayButton')
say_it.click

said = driver.find_element(:name, 'sayLabel')

puts said.text

stop_appium_ios_driver
