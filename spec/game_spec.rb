require 'rspec'
require './lib/game.rb'

RSpec.describe do
  context "initialize" do
    it "exists" do
      game = Game.new

      expect(game).to be_a Game
    end
  end
  context "it can start" do

    it "can play" do

    end

    it "can give instructions" do
      game = Game.new


      expect(game.instruction).to eq('abc')

    end

    it "can quit" do

    end
  end
end
