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

  it "can determine if an input is invalid" do
    sequence = ['R', 'R', 'R', 'R']
    evaluator = Evaluator.new(sequence)
    input_1 = evaluator.valid_input?("rrr")
    input_2 = evaluator.valid_input?("rrrrr")
    input_3 = evaluator.valid_input?('rrrr')
    input_4 = evaluator.valid_input?('1234')

    expect(input_1).to eq(false)
    expect(input_2).to eq(false)
    expect(input_3).to eq(nil)
    expect(input_4).to eq(false)
  end

  
end
