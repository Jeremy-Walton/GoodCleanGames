require 'spec_helper'

describe User do

  describe 'When not signed in' do

    subject { page }

    before(:each) do
      visit '/'
    end

    it { should have_link('Sign Up', href: '/users/sign_up') }
    it { should have_link('Sign In', href: '/users/sign_in') }
    it { should have_link('Home', href: '/') }

  end

  describe 'when signed in' do

    subject { page }

    before(:each) do
      visit '/'
      click_link "Sign Up"
      sign_up
      click_link "Sign Out"
      click_link "Sign In"
      sign_in
    end

    it { should have_link('Home', href: '/') }
    it { should have_link('Sign Out', href: '/users/sign_out') }
    it { should have_link('Games', href: '/games') }

  end

  describe 'When signed up' do

    subject { page }

    before(:each) do
      visit '/'
      click_link "Sign Up"
      sign_up
    end

    it { should have_content('Good Clean Games') }
    it { should have_link('Sign Out', href: '/users/sign_out') }
    it { should have_link('Games', href: '/games') }

  end

end
