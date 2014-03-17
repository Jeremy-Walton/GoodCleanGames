require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'GoodCleanGames.com'" do
      visit '/'
      expect(page).to have_content('GoodCleanGames.com')
    end

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

  # will be changed when I improve gamelist
  describe "Games page" do

    before(:each) do
    visit '/'
    click_link "Sign Up"
    sign_up
    click_link "Sign Out"
    click_link "Sign In"
    sign_in
  end

  subject { page }

  it { should have_link('Sign Out', href: '/users/sign_out') }
  it { should have_link('Games', href: '/games') }

    it "should contain game" do
      visit '/games'
      expect(page).to have_content('Games page!')
      expect(page).to have_content('Jeremy Walton')
    end
  end
end