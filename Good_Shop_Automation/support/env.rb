require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'page-object'
require 'require_all'
require 'yaml'
require 'site_prism'


######### Definition to create object for the class ############
def on(class_name)
  yield class_name.new
end

####### To Load all the libraries #################
require_all './lib'

############# Read user credentials from the users.yml file #########################
path = 'C:/Good_Shop_Automation/config/users.yml'
app_access = YAML.load(File.open(path))
# puts "app_access:#{app_access}"
$user_email = app_access["prod"]["user"]
$user_pwd = app_access["prod"]["pass"]

############ Read Browser type from the browser.yml file #########################
path = 'C:/Good_Shop_Automation/config/browsers.yml'
browser_type = YAML.load(File.open(path))
puts"browser:#{browser_type['browser']}"

########## Switching the browsers based on the browser info specified in the browsers.yml file#############
if browser_type['browser'].downcase == 'chrome'
  Capybara.default_driver = :chrome
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
elsif browser_type['browser'].downcase == 'firefox'
  Capybara.default_driver = :firefox
  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
end