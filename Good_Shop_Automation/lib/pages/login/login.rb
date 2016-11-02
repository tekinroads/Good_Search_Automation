class LoginPage < SitePrism::Page
  # include PageObject
  # include Capybara::DSL

############ Page Objects using Site Prism ########################
  element :user_email, "input[name='login[email]']"
  element :password, "input[id='login_password']"


################ Reusable Definitions for Login Page ##############
  def log_in(user_name, pwd)
    user_email.set(user_name)
    password.set(pwd)
    click_on('log in')
  end

end


