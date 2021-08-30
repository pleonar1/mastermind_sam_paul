class Game
  def initialize

  end

  def start
    puts "Welcome to MASTERMIND\n"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print ">"
    input = $stdin.gets.chomp
    if input.downcase == "p"
      #play method
    elsif input.downcase == "i"
      instruction
    elsif input.downcase == "q"
      #quit method?
    else
      start
    end
  end

  def play
  end

  def instruction
    p "abc"
  end

  def quit
  end

end
