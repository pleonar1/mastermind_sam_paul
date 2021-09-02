class Game

  attr_reader   :difficulty,
                :code,
                :colors

  def initialize(difficulty = "Beginner")
    @difficulty = difficulty
    @sequence    = Sequence.new(@difficulty)
    @code       = sequence.generate
    @colors     = sequence.colors
  end

  def start
    puts "I have generated a #{difficulty} sequence with four elements made up of:"
    puts "#{colors}"
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
    puts ">"

    turn_flow
  end

  # def generate
  #   sequence = Sequence.new
  #   @code = sequence.generate
  # end

  def turn_flow #maybe restructure as a loop eventually?
    input = $stdin.gets.chomp

    if input.downcase == "q" || input.downcase == "quit"
      quit
    elsif input.downcase == "c" || input.downcase == "cheat"
      puts @code
    elsif input.length < 4
      puts "Too short, guess again"
    elsif input.length > 4
      puts "Too long, guess again"
    else
      correct_colors = compare_colors(input) #return the status
      correct_positions = compare_positions(input)
      puts "You have #{correct_colors} and #{correct_positions} are in the correct position"
    end
  end

  def compare_colors(input)
    guess = input.upcase.chars
    correct_colors = 0

    @colors.each do |color|
      if guess.include? color
        correct_colors += @code.count(color)
      end
    end
    correct_colors
  end

  def compare_positions(input)
    guess = input.upcase.chars
    correct_positions = 0

    (0..3).each do |index|
      if @code[index] == guess[index]
        correct_positions += 1
      end
    end
    correct_positions
  end

  def quit
  end


end
