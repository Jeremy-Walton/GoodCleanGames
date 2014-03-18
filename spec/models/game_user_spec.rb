require 'spec_helper'

describe GameUser do
  let(:game_user) { GameUser.new(game_id: 1, user_id: 1) }
  subject { game_user }

  it { should respond_to(:game_id) }
  it { should respond_to(:user_id) }

  it "should save to and retrieve from the database" do
    game_user.save
    expect(GameUser.first.game_id).to eq(1)
    expect(GameUser.first.user_id).to eq(1)
  end
end
