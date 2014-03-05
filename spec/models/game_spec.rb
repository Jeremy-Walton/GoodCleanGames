require 'spec_helper'

describe Game do

  let(:game) { Game.new(game_type: "I Doubt It", name: "Jeremy Save", data: "JSON") }

  subject { game }

  it { should respond_to(:game_type) }
  it { should respond_to(:name) }
  it { should respond_to(:data) }

  it "should save to and retrieve from the database" do
  	game.save
  	expect(Game.first.game_type).to eq("I Doubt It")
  	expect(Game.first.name).to eq("Jeremy Save")
  	expect(Game.first.data).to eq("JSON")
  end
end