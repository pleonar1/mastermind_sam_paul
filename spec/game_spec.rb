require 'rspec'
require './lib/game.rb'
require './lib/sequence.rb'

RSpec.describe do
  before :each do
    @game = Game.new
  end

  it 'exists' do
    expect(@game).to be_a Game
  end

  it 'compares positions' do
    @game.compare_positions('rbrb')
  end
end
