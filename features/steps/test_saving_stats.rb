require 'net/http'

class Spinach::Features::TestSavingStats < Spinach::FeatureSteps
  step 'I am signed in' do
    visit '/'
    click_link "Sign In"
    fill_in "Email",    with: "user1943876046458579809@example.com"
    fill_in "Password", with: 'password'
    click_button "Sign in"
  end

  step 'I navigate to the game page' do
    click_link "Games"
  end

  step 'It updates stats' do
    # statistic = Stat.new(game_type: "I Doubt It", user_id: 1, times_player: 0, wins: 0, losses: 0)
    pending "Not sure how to implement this test."
  end
end
