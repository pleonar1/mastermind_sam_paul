require 'rspec'
require './lib/game.rb'
RSpec.describe do
  context "initialize" do
    it "exists" do
      game = Game.new

      expect(game).to be_a Game
    end
  end
end
