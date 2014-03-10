class Spinach::Features::TestUsernameIsTiedToIdoubtit < Spinach::FeatureSteps
  step 'I am signed up and signed in' do
    visit '/'
    click_link "Sign Up"
    @name = "#{Time.now.to_i * 2}"
    fill_in "Email",    with: "#{@name}@example.com"
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign up"
  end

  step 'I navigate to the game page' do
    visit '/games/IDoubtIt'
    # binding.pry
  end

  step 'It should display my username' do
    expect(page).to have_content("| #{@name} |")
  end
end
