require 'spec_helper'

shared_examples Game do

  let(:game) { described_class.new( name: "Jeremy Save", data: "JSON", number_of_players: 1, number_of_robots: 0) }

  subject { game }

  it { should respond_to(:name) }
  it { should respond_to(:data) }
  it { should respond_to(:number_of_players) }
  it { should respond_to(:number_of_robots) }

  it "should save to and retrieve from the database" do
  	game.save
  	expect(Game.first.name).to eq("Jeremy Save")
  	expect(Game.first.data).to eq("JSON")
    expect(Game.first.number_of_players).to eq(1)
    expect(Game.first.number_of_robots).to eq(0)
  end
end