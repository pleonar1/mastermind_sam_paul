require './lib/game.rb'
require './lib/sequence.rb'

class Evaluator
  def initialize(input, code)
    @input = input
    @code = code
  end

  def compare_positions(input)
    guess = input.upcase.chars # => ['R', 'G', 'Y', 'R']
    correct_positions = 0

    (0..3).each do |index|
      if @code[index] == guess[index]
        correct_positions += 1
      end
    end
    correct_positions
  end

  def compare_colors(input)
    guess = input.upcase.chars # => ['R', 'G', 'Y', 'R']
    correct_colors = 0
    sequence = Sequence.new

    sequence.colors.each do |color|
      correct_colors += [guess.count(color), @code.count(color)].min
    end
    correct_colors
  end
end
