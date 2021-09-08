require 'rspec'
require './lib/game.rb'
require './lib/sequence.rb'
require './lib/evaluator.rb'

RSpec.describe do
  before :each do
    @game = Game.new
  end

  context "Instantiation" do
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
  end

  it "can start the game" do
    allow(@game).to receive(:start).and_return('Game Started!')

    expect(@game.start).to eq('Game Started!')
  end

  context "Evaluator" do
    before :each do
      @game = Game.new
      @code = ['R', 'B', 'Y', 'G']
    end

    it "creates an Evaluator" do
      expect(@game.evaluate(@code)).to be_a Evaluator
    end

    it "determines correct colors" do
      input_1 = 'RRBB'
      input_2 = 'rrby'
      evaluation_1 = @game.correct_colors(input_1, @code)
      evaluation_2 = @game.correct_colors(input_2, @code)

      expect(evaluation_1).to eq(2)
      expect(evaluation_2).to eq(3)
    end

    it "determines correct positions" do
      input_1 = 'RBBB'
      input_2 = 'yyrg'
      evaluation_1 = @game.correct_positions(input_1, @code)
      evaluation_2 = @game.correct_positions(input_2, @code)

      expect(evaluation_1).to eq(2)
      expect(evaluation_2).to eq(1)
    end
  end

  it "can be quit" do
    allow(@game).to receive(:quit).and_return('Game Ended')

    expect(@game.quit).to eq('Game Ended')
  end

  it "can be won" do
    correct_positions = 3
    expect(@game.winner?(correct_positions)).to be(false)

    correct_positions = 4
    expect(@game.winner?(correct_positions)).to be(true)
  end

  it "can find elapsed_time" do
    time = Time.now
    sleep(2)
    et = @game.elapsed_time(time)

    expect(et).to be_an(Array)
    expect(et).to eq([0,2])
  end
end
