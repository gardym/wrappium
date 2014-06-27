# Wrappium

## Installation

Get Appium

    npm install -g appium

Add this line to your application's Gemfile:

    gem 'wrappium'

And then execute:

    $ bundle

## Usage

See [example.rb](example.rb) for details, or just try:

    require 'wrappium'
    
    settings = { platformName: 'iOS', versionNumber: '7.1', app:  './build/Release-iphonesimulator/HelloWorld.app' }
    run_appium_ios(settings) do |driver|
      input = driver.find_element(:name, 'name')
      # etc...
    end

## Contributing

1. Fork it ( http://github.com/<my-github-username>/wrappium/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
