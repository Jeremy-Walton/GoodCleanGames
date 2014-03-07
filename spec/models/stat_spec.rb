require 'spec_helper'

describe Stat do

  let(:statistic) { Stat.new(game_type: "I Doubt It", user_id: 1, times_played: 1, wins: 1, losses: 0) }
  subject { statistic }

  it { should respond_to(:game_type) }
  it { should respond_to(:user_id) }
  it { should respond_to(:times_played) }
  it { should respond_to(:wins) }
  it { should respond_to(:losses) }

  it "should save to and retrieve from the database" do
    statistic.save
    expect(Stat.first.game_type).to eq("I Doubt It")
    expect(Stat.first.user_id).to eq(1)
    expect(Stat.first.times_played).to eq(1)
    expect(Stat.first.wins).to eq(1)
    expect(Stat.first.losses).to eq(0)
  end
end