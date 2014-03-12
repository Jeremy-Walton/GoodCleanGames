class Spinach::Features::TestSavingStats < Spinach::FeatureSteps
  step 'I am signed up and the signed in' do
    visit '/'
    click_link "Sign Up"
    @name = "#{Time.now.to_i}"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
  end

  step 'I navigate to the game page starting the game' do
    visit "/games/IDoubtIt"
  end

  step 'I navigate to the stats page' do
    find('.clickmenu').hover
    click_link "Stats"
  end

  step 'I should see the updated stats' do
    expect(page).to have_content("Game Times Played Wins Losses I Doubt It 1 0 0")
  end
end
