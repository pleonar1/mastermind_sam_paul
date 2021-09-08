require 'rspec'
require './lib/printer.rb'

RSpec.describe do
  before :each do
    @printer = Printer.new
  end

  it 'exists' do
    expect(@printer).to be_a Printer
  end

  it 'prints a welcome message' do
    expect(@printer.welcome).to be_nil
  end

  it 'prints instructions' do
    expect(@printer.instructions).to be_nil
  end

  it 'prints a start message' do
    difficulty1 = "Beginner"
    difficulty2 = "Intermediate"
    difficulty3 = "Advanced"

    expect(@printer.start_game(difficulty1)).to eq "What's your guess?"
    expect(@printer.start_game(difficulty2)).to eq "What's your guess?"
    expect(@printer.start_game(difficulty3)).to eq "What's your guess?"
  end

  it 'prompts inputs' do
    expect(@printer.input).to be_nil
  end

  it 'prints evaluations' do
    colors = 3
    positions = 2

    expect(@printer.evaluation(colors, positions)).to eq "You have 3 correct colors and 2 are in the correct positions."
  end

  it 'counts turns' do
    turn_count = 1
    expect(@printer.turn_counter(turn_count)).to eq "You've taken 1 guess."
    turn_count += 1
    expect(@printer.turn_counter(turn_count)).to eq "You've taken 2 guesses."
  end

  it 'prints a message at the end of the game' do
    code = ['R','B','Y','B']

    expect(@printer.end_game(code, 10, [4, 30])).to eq "Do you want to (p)lay again or (q)uit?"
  end

  it 'prints a quit game message' do
    expect(@printer.quit_game).to eq "-" * 70
  end

  it 'prints a quit menu message' do
    expect(@printer.quit_menu).to eq 'Have a nice day!'
  end
end
