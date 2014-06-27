require 'appium_lib'
require 'wrappium/appium_driver_ext'

module Wrappium
  def self.redirect_output_to_file(name)
    background_output_file_name = "#{name}-background.log"
    background_output_file = File.open(background_output_file_name, 'w') rescue nil

    if background_output_file.nil?
      puts "Can't open #{background_output_file_name} for logging, using stdout/err."
    else
      $stdout.reopen background_output_file
      $stderr.reopen background_output_file
    end
  end

  def self.term(pid)
    Process.kill('TERM', pid)
  end

  def self.run_in_parallel(*args)
    background_pid = fork do
      redirect_output_to_file(args.first)
      exec *args
    end

    trap('INT') { term(background_pid) and exit 1 }

    puts "Starting: #{args.join(' ')} [#{background_pid}]..."
    yield
    term(background_pid)
  end

end

def run_appium_ios(simulator_settings)
  driver_settings = {
    caps: simulator_settings,
    appium_lib: { sauce_username: nil, sauce_access_key: nil } # don't run on Sauce
  }

  Wrappium::run_in_parallel('appium', '--log-no-colors') do
    driver = Appium::Driver.new(driver_settings)
    driver.wait_for_connection

    driver.start_driver
    yield driver
    driver.driver_quit
  end
end
