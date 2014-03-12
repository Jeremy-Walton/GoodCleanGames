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
    page.has_content?('Welcome to GoodCleanGames.com')
    click_link "Sign Out"
    click_link "Sign In"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    click_button "Sign in"
    expect(page).to have_content('Welcome to GoodCleanGames.com')
  end

  step 'I am signed up and signed in' do
    visit "/"
    click_link "Sign Up"
    @name = "user#{Time.now.to_i * Time.now.to_i + 2}"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
  end

  step 'I click the games link' do
    click_link "Games"
  end

  step 'I should see a list of games' do
    expect(page).to have_content("I Doubt It")
    expect(page).to have_content("Crazy Eights(not available yet)")
  end

  step 'I click to play I Doubt It' do
    within '.IDoubtIt' do
      click_on 'Play'
    end
  end

  step 'I fill out the new game form' do
    fill_in :game_session_number_of_players, with: 2
    click_on 'Create'
  end

  step 'I should see the game' do
    expect(page).to have_content("Welcome to I Doubt It. Lie at your own risk!")
  end
end
