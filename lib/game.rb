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

  def generate #come back to this to randomize
    ['R', 'G', 'Y', 'B']
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

  def compare(input)
    guess = input.chars
  end

  def quit
  end


end
