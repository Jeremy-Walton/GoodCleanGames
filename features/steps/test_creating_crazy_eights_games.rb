class Spinach::Features::TestCreatingCrazyEightsGames < Spinach::FeatureSteps
  step 'I am signed up and the signed in' do
    visit '/'
    click_link "Sign Up"
    @name = "#{Time.now.to_i}"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
  end

  step 'I create a crazy eights game' do
    @game_id = Time.new.to_i/10
    game = CrazyEightsGame.new(id: @game_id, name: "crazy", data: "empty", number_of_players: 1)
    game.save
  end

  step 'I navigate to the crazy eights game list' do
    visit "/crazy_eights"
  end

  step 'I should see the game displayed' do
    expect(page).to have_content("#{@game_id}crazy1")
  end
end
