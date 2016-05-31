# Before each scenario, except headless and manual ones
include Selenium
# Set up browser
b = 'chrome'# default to firefox, chrome or IE
b = ENV['BROWSER'] unless ENV['BROWSER'].nil?

if b == 'headless'
  require 'headless'
  headless = Headless.new
  headless.start
  at_exit do
    headless.destroy
  end
elsif b == 'iPhone5'
  caps =
      {
          platformName: 'iOS',
          platformVersion: '9.2',
          deviceName: 'iPhone 5',
          browserName: 'Safari'
      }
  driver = Selenium::WebDriver.for(:remote, :url => "http://10.11.14.53:4723/wd/hub", :desired_capabilities => caps)
  browser = Watir::Browser.new(driver)
elsif b == 'iPhone6'
  caps =
      {
          platformName: 'iOS',
          platformVersion: '9.2',
          deviceName: 'iPhone 6',
          browserName: 'Safari'
      }
  driver = Selenium::WebDriver.for(:remote, :url => "http://10.11.14.53:4723/wd/hub", :desired_capabilities => caps)
  browser = Watir::Browser.new(driver)
elsif b == 'iPhone6Plus'
  caps =
      {
          platformName: 'iOS',
          platformVersion: '8.1',
          deviceName: 'iPhone 6 Plus',
          browserName: 'Safari'
      }
  driver = Selenium::WebDriver.for(:remote, :url => "http://10.11.14.53:4723/wd/hub", :desired_capabilities => caps)
  browser = Watir::Browser.new(driver)
elsif b == 'iPad2'
  caps =
      {
          platformName: 'iOS',
          platformVersion: '8.1',
          deviceName: 'iPad 2',
          browserName: 'Safari'
      }
  driver = Selenium::WebDriver.for(:remote, :url => "http://10.11.14.53:4723/wd/hub", :desired_capabilities => caps)
  browser = Watir::Browser.new(driver)
elsif b == 'iPadAir'
  caps =
      {
          platformName: 'iOS',
          platformVersion: '8.1',
          deviceName: 'iPad Air',
          browserName: 'Safari'
      }
  driver = Selenium::WebDriver.for(:remote, :url => "http://10.11.14.53:4723/wd/hub", :desired_capabilities => caps)
  browser = Watir::Browser.new(driver)
end

unless  b == 'iPhone5' || b == 'iPad2' || b == 'iPhone6' || b == 'iPhone6Plus' || b == 'iPadAir'
  browser = Watir::Browser.new(b.to_sym)
end
Watir.default_timeout = 180

Before('~@headless', '~@manual') do
  @browser = browser
  browser.cookies.clear
    unless (b == 'iPhone5' || b == 'iPad2' || b == 'iPhone6' || b == 'iPhone6Plus' || b == 'iPadAir')
      #browser.window.resize_to(1300, 800)

      if (b == 'chrome')
        browser.window.resize_to(1400, 768) #Chrome doesn't seem to honour window.maximize
      else
      browser.driver.manage.window.maximize
      end
    end
end


# After each scenario, except headless and manual ones
After('~@headless', '~@manual') do |scenario|
  @browser.driver.manage.delete_all_cookies
  # Output a screenshot if the scenario failed
  if scenario.failed?

    output_path = File.expand_path(File.dirname(__FILE__) + '/../../results/screenshots/')
    scenario_name = scenario.to_sexp[3].gsub(/[^\w\-]/, ' ') + " #{Time.now.strftime("%d-%m-%y %H.%M.%S")}"
    output_path += '/' + scenario_name + '.png'

    @browser.driver.save_screenshot(output_path)
    encoded_img = @browser.driver.screenshot_as(:png)
    embed("data:image/png;base64,#{encoded_img}", 'image/png')

    puts scenario_name
    puts "Screenshot saved to #{output_path}"
    puts @browser.url
  end

end

# After all features have executed
at_exit do
  #headless.destroy
  browser.quit unless b == 'headless'
end

