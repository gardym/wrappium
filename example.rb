require 'appium_lib'
require 'wrappium'

APP_PATH = '../build/Release-iphonesimulator/SayHello.app'

run_appium_ios(APP_PATH) do |driver|
  input = driver.find_element(:name, 'sayName')
  input.send_keys('World')

  say_it = driver.find_element(:name, 'sayButton')
  say_it.click

  said = driver.find_element(:name, 'sayLabel')

  puts said.text
end
