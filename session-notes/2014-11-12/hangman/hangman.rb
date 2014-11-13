# nouns
# game
# player
# word
# letter
# slot / space
# guess

# verbs
# guess
# win / complete
# fail / hanged

require_relative 'hangman_game'

guess_word = %w(waffles bananas horses giraffes).sample

game = HangmanGame.new(guess_word)

until game.completed?
  puts "Turns remaining: #{game.turns_remaining}"
  puts "Word: #{game.filled_word}"

  user_guess = gets.chomp

  if game.guess!(user_guess)
    puts "Success!"
  else
    puts "Oh no. :("
  end
end

if game.turns_remaining.zero?
  puts "WELCOME TO THE END, LOSER."
else
  puts "Congratulations you world champion, you."
end
