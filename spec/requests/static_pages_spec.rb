require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'GoodCleanGames.com'" do
      visit '/static_pages/home'
      expect(page).to have_content('GoodCleanGames.com')
    end
  end
end