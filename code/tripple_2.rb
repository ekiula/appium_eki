require 'rubygems'
require 'appium_lib'

#APP_PATH = '/Users/ahmadfmudzaki/Downloads/1442782901_app-staging-debug-040.apk'

desired_caps = {
  caps:       {
  platformName:     'Android',
  platformVersion:  '5.1',
  deviceName:       '4df1fe711a3d5f99',
  #app:           APP_PATH,
  appPackage:     'com.tripple.tripple',
  #appActivity:    'com.tripple.tripple.SplashActivity',

  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil
  }
}

server_url = "http://127.0.0.1:4723/wd/hub"

Appium::Driver.new(desired_caps).start_driver
Appium.promote_appium_methods Object

wait = Selenium::WebDriver::Wait.new(:timeout => 15)

#wait.until{Appium.find_element(:name, "Allow")}

#waiting for login with fb button then click on it
wait.until{Appium.find_element(:name, "Log in with Facebook")}
Appium.find_element(:name, "Log in with Facebook").click

#wait till button appears
wait.until{button(1)}

# Find every text field
elements	= textfields

#values for text
values		= ["eki2359ula@gmail.com", "sekolah4n"]

#fill in textbox
elements.each_with_index do |element, index|
	element.type values[index]
end

#click masuk
button(1).click

#wait for button
#buttonoke = find_elements :uiautomator, 'new UiSelector().description("OK")'
buttonoke = Appium.find_element(:uiautomator, 'new UiSelector().description("OK")').click
wait.until{buttonoke}
puts "akhirnya kepijet"

sleep 30

driver_quit