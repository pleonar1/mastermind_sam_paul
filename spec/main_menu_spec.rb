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

  context "functionality" do
    it "can quit" do
      expect(@menu.quit).to eq('Have a nice day!')
    end
  end
end
