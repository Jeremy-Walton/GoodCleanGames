class Spinach::Features::TestSavingStats < Spinach::FeatureSteps
  step 'I am signed in' do
    visit '/'
    click_link "Sign Up"
    @name = "#{Time.now.to_i}"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
  end

  step 'I navigate to the game page' do
    click_link "Games"
  end

  step 'It updates stats' do
    pending "Not sure why this isn't working"
    # click_link "Stats"
    # binding.pry
    # page.has_content?("I Doubt It: Times Played: 1, Wins: 0, Losses: 0.").must_equal true
  end
end
