require 'rspec'
require './lib/game.rb'
require './lib/sequence.rb'
require './lib/evaluator.rb'

RSpec.describe do
  before :each do
    @game = Game.new
  end

  it 'exists' do
    expect(@game).to be_a Game
  end

  it 'has a default difficulty' do
    expect(@game.difficulty).to eq('Beginner')
  end

  it "can have other difficulties" do
    @game_2 = Game.new('Intermediate')

    expect(@game_2.difficulty).to eq('Intermediate')
  end

  xit "can complete multiple turns?" do
    @code = ["R", "B", "G", "Y"]
    evaluator = Evaluator.new(@code)
    input_1 = "rbyg"
    evaluator.compare_positions(input_1)
    input_2 = "ryyg"
    evaluator.compare_positions(input_2)
    input_3 = "rrrr"
    evaluator.compare_positions(input_3)
    input_4 = "bbbb"
    evaluator.compare_positions(input_4)


    expect(game.game_end).to eq(4)



  end

  xit "can quit the game" do
    #Look at spec docs, expect Game to not exist anymore

  end

  it "can be won" do
    code = @game.code
    input = code.join
    evaluator = Evaluator.new(code)
    correct_positions = evaluator.compare_positions(input)


    expect(@game.winner?(correct_positions)).to be(true)
  end

  xit "can calculate the time played" do


  end
end
