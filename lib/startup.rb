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
    p "abc"
  end

  def quit
    p "Goodbye"
  end

end
