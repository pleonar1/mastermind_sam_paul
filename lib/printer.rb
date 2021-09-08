class Printer
  def initialize
  end

  def welcome
    puts "Welcome to MASTERMIND\n\n"
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "
  end

  def instructions
    puts "1) When the game begins, a random sequence of 4 colors is generated."
    puts "These colors include (R)ed, (B)lue, (G)reen, and (Y)ellow."
    puts "-- For Intermediate difficulty, (P)urple is included and the"
    puts "sequence is 6 characters long."
    puts "-- For Advanced difficulty, (P)urple and (O)range are included"
    puts "and the sequence is 8 characters long.\n\n"
    puts "2) The player must try to guess the secret code by entering the first"
    puts "letter of the corresponding color (e.g. 'RGRY' or 'bybb'). No spaces"
    puts "are required between colors and guesses are case insensitive.\n\n"
    puts "3) The player will receive feedback after each guess regarding how"
    puts "many colors they guessed correctly, and how many of those were in the"
    puts "correct position.\n\n"
    puts "4) The game ends when the player correctly guesses the secret code.\n\n"
    puts "Good luck and have fun!"
    puts "-" * 20
  end

  def start_game(difficulty)
    if difficulty == "Beginner"
      puts "\n"
      puts "I have generated a #{difficulty} sequence with four elements made up of:"
      p "(R)ed, (B)lue, (G)reen, and (Y)ellow."
    elsif difficulty == "Intermediate"
      puts "\n"
      puts "I have generated a #{difficulty} sequence with six elements made up of:"
      p "(R)ed, (B)lue, (G)reen, (Y)ellow, and (P)urple."
    elsif difficulty == "Advanced"
      puts "\n"
      puts "I have generated a #{difficulty} sequence with eight elements made up of:"
      p "(R)ed, (B)lue, (G)reen, (Y)ellow, (P)urple, and (O)range."
    end
    puts "\n"
    puts "Use (q)uit at any time to end the game.\n\n"
    puts "- - - - -"
    p "What's your guess?"
  end

  def input
    print "> "
  end

  def evaluation(correct_colors, correct_positions)
    p "You have #{correct_colors} correct colors and #{correct_positions} are in the correct positions"
  end

  def turn_counter(turn_counter)
    if turn_counter != 1
      puts "You've taken #{turn_counter} guesses.\n\n"
    else
      puts "You've taken 1 guess.\n\n"
    end
  end

  def end_game(code, turn_counter, final_time)
    puts "Congratulations! You guessed the sequence #{code} in #{turn_counter} guesses over #{final_time[0]} minutes and #{final_time[1]} seconds."
    puts "Do you want to (p)lay again or (q)uit?"
    print "> "
  end

  def quit_game
    puts "Game abandoned."
    p "-" * 70
  end

  def quit_menu
    p 'Have a nice day!'
  end
end
