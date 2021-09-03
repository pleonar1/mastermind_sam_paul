require './lib/game.rb'

class Startup

  def initialize
  end

  def intro
    puts "Welcome to MASTERMIND\n"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
    input = $stdin.gets.chomp
    if input.downcase == "p" || input.downcase == "play"
      play
    elsif input.downcase == "i" || input.downcase == "instructions"
      instructions
    elsif input.downcase == "q" || input.downcase == "quit"
      quit
    else
      puts "Input not understood."
      intro # is this bad?
    end
  end

  def play
    game = Game.new
    game.start
  end

  def instructions
    puts "1) When a player starts the game, a random sequence of the colors Red,"
    puts "Blue, Green, or Yellow will be generated as a secret code of 4 characters"
    puts "2) For higher level difficulty Intermediate, Purple is included and the"
    puts "sequence is 6 characters"
    puts "3) For higher level difficulty Advanced Purple and Orange are included"
    puts "and the sequence is 8 characters"
    puts "4) The player will try to guess the secret code by inputing the"
    puts "corresponding color's keys such as 'rybg'"
    puts "5) Red = r, Blue = b, Yellow = y, Green = g, Purple = p, Orange = o"
    puts "6) The player will be told after each guess how many colors they guessed"
    puts "correctly and how many colors they guessed in the correct position"
    puts "7) The game ends when the player correctly guesses the secret code"
    intro
  end

  def quit
    p "Goodbye"
  end
end
