require 'capybara/rspec'

Capybara.register_driver :remote_chrome do |app|
  
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      prefs: {
        'download.default_directory' => DownloadHelper::PATH.to_s
      },
      args: [
        '--headless',
        '--window-size=1400,1400',
        '--no-sandbox',
        '--disable-dev-shm-usage',
        '--lang=ja-JP',
      ],
    }
  )
  Capybara::Selenium::Driver.new(app, browser: :remote,  url: url, desired_capabilities: capabilities,
  )
  # Capybara::Selenium::Driver.new(app, browser: :remote, url: url, options: options)
  # Capybara::Selenium::Driver.new(app, browser: :remote, url: url, desired_capabilities: caps)
end

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    #driven_by :selenium_chrome_headless

    Capybara.server_host = IPSocket.getaddress(Socket.gethostname)
    Capybara.server_port = 4444
    Capybara.app_host = "http://#{Capybara.server_host}:#{Capybara.server_port}"
    driven_by :remote_chrome
  end
end

# RSpec.configure do |config|
#   config.before(:each, type: :system) do
#     driven_by :selenium, using: :headless_chrome, options: {
#       browser: :remote,
#       url: ENV.fetch("SELENIUM_DRIVER_URL"),
#       desired_capabilities: :chrome
#     }
#     Capybara.server_host = 'web'
#     Capybara.app_host="http://#{Capybara.server_host}"
#   end
# end
