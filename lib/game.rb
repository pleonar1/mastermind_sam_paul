class Game
  def initialize(difficulty = "Beginner")
    @difficulty = difficulty
    @sequence = ''
  end

  def start
    @sequence = generate

    puts "I have generated a #{difficulty} sequence with four elements made up of:"
    puts "#{colors}"
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
    puts ">"

    turn_flow
  end

  def colors
    if @difficulty == "Beginner"
      ['R', 'B', 'G', 'Y']
    end
  end

  def generate #come back to this to randomize // would it be better to use a hash here?
    { #positions are keys, colors are values
      0 => 'R',
      1 => 'B',
      2 => 'G',
      3 => 'Y'
    }
  end

  def turn_flow #maybe restructure as a loop eventually?
    input = $stdin.gets.chomp

    if input == "q" || input == "quit"
      quit
    elsif input == "c" || input == "cheat"
      puts @sequence
    elsif input.length < 4
      puts "Too short, guess again"
    elsif input.length > 4
      puts "Too long, guess again"
    else
      compare(input) #return the status
    end
  end

  def compare_elements(input)
    guess = input.upcase.chars
    correct_elements = 0
    

  end

  def compare_positions(input)
    guess = input.upcase.chars
    correct_positions = 0
    guess.each do |index|
      if @sequence[index] == guess[index]
        correct_positions += 1
      end
    end
  end

  def quit
  end


end
