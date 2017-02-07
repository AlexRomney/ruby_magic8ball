require 'colorize'
require 'pry'

ANSWERS = [
  'Absolutely!',
  'Heck Yeah!',
  'Ehhhhhh, Prolly Not',
  'Hmmmmmm...IDK',
  'Are You Seriously asking!?',
  'Wrong!',
  'YAAAASSSSS!'
]
@answer_clone = ANSWERS.clone

def welcome
  puts "RUBY MAGIC 8 BALL".colorize(:color => :green)
  menu
end

def menu
  puts "\nLet's Play!\n".colorize(:color => :light_blue)
  puts "1. Play Game"
  puts "2. Customize"
  puts "3. Type 'quit' to exit the game".colorize(:color => :yellow)
  puts "\nPick an option!\n"

  case user_input
    when '1'
      game_on
    when '2'
      customize_game
    when '3', 'quit'
      puts "Thank you for playing! Until next time!".colorize(:color => :green)
      exit
    else
      puts "Invalid option! Try again!".colorize(:color => :red)
      menu
  end
end

def game_on
  puts "\nWhat do you wish to ask the Magic 8 Ball?\n".colorize(:color => :light_blue)
  @question = user_input
  if @question == 'quit'
    puts "We'll see you soon!".colorize(:color => :green)
    menu
  end
  print "\nThe Magic 8 Ball says: \n".colorize(:color => :green)
  puts @answer_clone.sample
  game_on
end

def customize_game
  puts "\n*** Customized Magic 8 Ball ***\n".colorize(:color => :green)
  puts "1) Add Answers"
  puts "2) View All Answers"
  puts "3) Reset Answers"
  puts "4) Back To The Game"
  puts "\nPick an Option\n"

  case user_input
    when '1'
      puts "What answer do you want to add to the Magic 8 Ball?"
      @added_answer = user_input
      if ANSWERS.include?(@added_answer)
        puts "Answer already exists. Please try a different one."
        customize_game
      end
      @answer_clone << @added_answer
      puts "\n#{@added_answer} has been added to the Magic 8 Ball".colorize(:color => :green)
      customize_game
    when '2'
      puts "** 8 Ball Answers **".colorize(:color => :green)
      view_all_answers
    when '3'
      puts "Are you sure you want to reset?"
      @user_reset = user_input
      if @user_reset == 'yes'
        @answer_clone = ANSWERS.clone
        puts "\nYour answers have been reset!".colorize(:color => :light_blue)
        customize_game
      else
        customize_game
      end
    when '4'
      menu
    else
      puts "Please pick a valid option!"
      customize_game
    end
end

def view_all_answers
  @answer_clone.each_with_index do |x,y|
    puts "#{y + 1}. #{x}"
  end
  puts "Type 'back' to return to the menu"
  input = gets.strip
  if input == 'back'
    customize_game
  else
    puts "Just type 'back' to get back to the menu".colorize(:color => :yellow)
    view_all_answers
  end
end

def user_input
  print "> "
  gets.strip
end

welcome
