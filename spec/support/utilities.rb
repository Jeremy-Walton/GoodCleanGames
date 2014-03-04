include ApplicationHelper

def sign_up
	fill_in "Email",    with: 'jthelegoman@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "user[password_confirmation]", with: 'password'
    click_on "Sign up"
end

def sign_in
    fill_in "Email",    with: 'jthelegoman@gmail.com'
    fill_in "Password", with: 'password'
    click_button "Sign in"
end