require './lib/sequence.rb'

RSpec.describe do
  it 'exists' do
    sequence = Sequence.new

    expect(sequence).to be_a Sequence
  end

  it 'generates a sequence' do
    sequence = Sequence.new
    code = sequence.generate

    expect(code.length).to eq 4
  end

  it "generates random sequences" do
    sequence_1 = Sequence.new
    sequence_2 = Sequence.new
    code_1 = sequence_1.generate
    code_2 = sequence_2.generate

    #This test may not always pass because there is a low posibility of
    #code_1 and code_2 being equal, chance of fail is 1/256
    expect(code_1 == code_2).to eq(false)
  end
end
