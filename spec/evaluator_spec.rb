require './lib/evaluator.rb'

RSpec.describe do
  it 'exists' do
    evaluator = Evaluator.new

    expect(evaluator).to be_a Evaluator
  end

  it "can compare positons" do### might need input here
    evaluator = Evaluator.new
    guess = ['R', 'R', 'B', 'B']
    @code = ['R', 'R', 'R', 'R']
    evaluator.compare_positions

    expect(correct_positions).to eq(2)
  end

  it "can compare colors" do
    evaluator = Evaluator.new
    guess = ['R', 'R', 'B', 'B']
    sequence = ['R', 'R', 'R', 'R']
    evaluator.compare_colors

    expect(correct_colors).to eq(2)
  end
