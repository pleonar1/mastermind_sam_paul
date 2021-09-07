require './lib/evaluator.rb'

RSpec.describe do
  it 'exists' do
    code = ['R', 'R', 'R', 'R']
    evaluator = Evaluator.new(code)

    expect(evaluator).to be_a Evaluator
  end

  it "can compare positons" do
    sequence = ['R', 'R', 'R', 'R']
    input_1 = 'RRBB'
    input_2 = 'yygr'
    evaluator = Evaluator.new(sequence)

    evaluation_1 = evaluator.compare_positions(input_1)
    evaluation_2 = evaluator.compare_positions(input_2)

    expect(evaluation_1).to eq(2)
    expect(evaluation_2).to eq(1)
  end

  it "can compare colors" do
    sequence = ['R', 'R', 'R', 'R']
    input_1 = 'RRBB'
    input_2 = 'rrbr'
    evaluator = Evaluator.new(sequence)
    evaluation_1 = evaluator.compare_colors(input_1)
    evaluation_2 = evaluator.compare_colors(input_2)

    expect(evaluation_1).to eq(2)
    expect(evaluation_2).to eq(3)
  end
end
