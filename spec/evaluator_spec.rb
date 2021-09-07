require './lib/evaluator.rb'

RSpec.describe do
  it 'exists' do
    guess = ['R', 'R', 'B', 'B']
    code = ['R', 'R', 'R', 'R']
    evaluator = Evaluator.new(guess, code)


    expect(evaluator).to be_a Evaluator
  end

  it "can compare positons" do### might need input here
    guess = ['R', 'R', 'B', 'B']
    code = ['R', 'R', 'R', 'R']
    input = 'RRBB'
    evaluator = Evaluator.new(guess, code)
    evaluation = evaluator.compare_positions(input)

    expect(evaluation).to eq(2)
  end

  it "can compare colors" do
    guess = ['R', 'R', 'B', 'B']
    sequence = ['R', 'R', 'R', 'R']
    input = 'RRBB'
    evaluator = Evaluator.new(guess, sequence)
    evaluation = evaluator.compare_colors(input)



    expect(evaluation).to eq(2)
  end
end
