require './lib/evaluator.rb'

RSpec.describe do
  before :each do
    @code = ['R', 'B', 'Y', 'G']
    @evaluator = Evaluator.new(@code)
  end

  it 'exists' do
    expect(@evaluator).to be_a Evaluator
  end

  it "can compare positons" do
    input_1 = 'RBBB'
    input_2 = 'yyrg'

    evaluation_1 = @evaluator.compare_positions(input_1)
    evaluation_2 = @evaluator.compare_positions(input_2)

    expect(evaluation_1).to eq(2)
    expect(evaluation_2).to eq(1)
  end

  it "can compare colors" do
    input_1 = 'RRBB'
    input_2 = 'rrby'
    evaluation_1 = @evaluator.compare_colors(input_1)
    evaluation_2 = @evaluator.compare_colors(input_2)

    expect(evaluation_1).to eq(2)
    expect(evaluation_2).to eq(3)
  end

  it "can determine if an input is valid" do
    input_1 = "rrr"
    input_2 = "rrrrr"
    input_3 = 'rrrr'
    input_4 = 'abcd'

    expect(@evaluator.valid_input?(input_1)).to eq(false)
    expect(@evaluator.valid_input?(input_2)).to eq(false)
    expect(@evaluator.valid_input?(input_3)).to eq(true)
    expect(@evaluator.valid_input?(input_4)).to eq(false)
  end
end
