require 'rspec'
require './lib/main_menu.rb'

RSpec.describe do

  before :each do
    @menu = MainMenu.new
  end

  context "initialize" do
    it "exists" do
      expect(@menu).to be_a MainMenu
    end
  end

  context "Game creation" do
    it "can create a game" do
      expect(@menu.create_game).to be_a(Game)
    end

    it "can start the game" do
      game = @menu.create_game
      allow(game).to receive(:start).and_return('Game Started!')
      # using a stub here to avoid actually starting a game
      
      expect(@menu.start_game(game)).to eq('Game Started!')
    end
  end
end
