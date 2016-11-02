
Before do|scenario|
  puts "scenario:#{scenario.name}"
  # Capybara::Selenium::Driver.maximize
  # take_screenshot(scenario)
end

After do|scenario|
  # take_screenshot2(Time.now.to_s)
  take_screenshot(scenario) if scenario.failed?
end


############# reusable definition to take screen shot and attach it to the .html report ############
def take_screenshot(scenario)
  screen_name = "log/screens/" +scenario.name+".png"
  page.save_screenshot(screen_name) rescue nil
  embed(screen_name, 'image/png') rescue nil
end