# There's no "driver.connected?" method or equivalent.
module Appium
  class Driver
    def wait_for_connection
      connection, retries = nil, 0
      puts 'Appium driver waiting to connect...'
      while connection.nil? and retries < 5
        connection = Net::HTTP.get('127.0.0.1', '/wd/hub', '4723') rescue nil
        retries += 1
        sleep 2
        puts "... still waiting."
      end
    end
  end
end
