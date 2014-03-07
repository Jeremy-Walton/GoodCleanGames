class Spinach::Features::TestUserInteraction < Spinach::FeatureSteps
  step 'I visit the front page' do
    visit '/'
  end

  step 'I click sign up' do
    click_link "Sign Up"
  end

  step 'I fill in the form' do
    @name = "user#{Time.now.to_i * Time.now.to_i}"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
  end

  step 'I am signed in' do
    # binding.pry
    page.has_content?('Welcome to GoodCleanGames.com')
    click_link "Sign Out"
    click_link "Sign In"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    click_button "Sign in"
  end

  step 'I visit the games page' do
    click_link "Games"
  end

  step 'the page should display the Game' do
    pending "Not implemented yet"
    # page.find(:xpath, "//div[contains(@class, 'Game_container')][contains(text(), 'I Doubt It')]").must_not_equal nil
  end
end
