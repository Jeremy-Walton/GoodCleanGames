require 'spec_helper'

describe User do
  
	it "should have the sign_in page" do
      visit '/users/sign_in'
      expect(page).to have_content('Sign in')
    end

    it "should have the sign_up page" do
      visit '/users/sign_up'
      expect(page).to have_content('Sign up')
    end

    it "should have the sign_up page" do
      visit '/users/password/new'
      expect(page).to have_content('Forgot your password?')
    end

end
