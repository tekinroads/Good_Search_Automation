When(/^I visit the Goodshop home page$/) do
  # visit 'https://www.goodsearch.com/'
  puts"url:#{ENV['PAGE_URL']}"
  visit ENV['PAGE_URL']
end

And(/^I click on Sign In link$/) do
  click_link('Sign In')
  sleep 8
end

When(/^I enter valid credentials and click on log in$/) do
  on(LoginPage) do |page|
    puts"Inside the Login Steps"
    page.log_in($user_email,$user_pwd)
  end
end

Then(/^I should be able to see the loged in user name$/) do
  sleep 5
  user = find(:xpath, '//div[@class="nav-user"]/span[1]').text
  puts"user:#{user}"
  if page.should have_content("#{user}")
    puts"#{user} has Loged in"
  else
    fail"!!!There is some problem with credentials, please check the registered credentials and try to login again"
  end
end

Then(/^I signout from the good search account$/) do
  find(:xpath, '//div[@class="nav-user"]').click
  click_on 'Sign out'
end

##### Code to verify the links present on webpage ############
And(/^I click on site merchant link and verify the links present$/) do
  find(:xpath,'//img[@title="Goodshop Logo"]').click
  sleep 3
  find(:xpath, '//div[@class="with-examples"]//li[2]').click
  sleep 5
  links_present = page.all('a').each{|e| p e[:href]}
  # links_present = page.all('li').each{|e| p e[:href]}


  # list_items = page.all('li').collect(&:href)
  # puts"list_items:#{list_items}"

  # links_present={}
  # page.find('.block').all
  # links_present = page.find(:xpath, './/a["href"]')[10]
  # page.findElements(By.xpath("//a"));

  # links_present << page.find(:xpath, './/a["href"]')
  # al = page.all(:xpath, ".//a[':href']")
  # test = page.all.find('li').find('a').find(:href)
  # p "test:#{test}"

  # Capybara.default_selector = :xpath
  # al = page.all('//a[@href != " "]')
  # al.each do |i|
  #   p al
  # end
  # p al.size


end

# When(/^I perform some search under websearch$/) do
# amount_donated_before = find(:xpath, '//div[@class="nav-user"]/span[2]').text
# puts"amount_donated_before:#{amount_donated_before}"
# search_keyword = 'Hotels in USA'
# fill_in('keywords', with:"#{search_keyword}")
# find(:xpath,'.//*[@class="search-bar with-web"]//button').click


# # temp = find(:xpath,".//h2/b[contains(text(), '#{search_keyword}')]").text
# temp = find(:xpath,".//div[@id='main']//h2/b").text
# puts"temp:#{temp}"
# fail"Search reasults diaplayed is :#{temp}" if find(:xpath,".//h2/b[contains(text(), #{search_keyword})]")
# end
#
# Then(/^I verify the donation which is inceresed on login user accoiunt$/) do
#   amount_donated_after = find(:xpath, '//div[@class="nav-user"]/span[2]').text
#   puts"amount_donated_after:#{amount_donated_after}"
#
# end
