class HangmanGame
  def initialize(guess_phrase)
    fail 'Guess phrase cannot be empty' if guess_phrase.empty?
    @guess_phrase = guess_phrase
    @filled_word = @guess_phrase.gsub(/\w/, '_')
    @turns_remaining = 10
  end

  def turns_remaining
    @turns_remaining
  end

  def filled_word
    @filled_word
  end

  def completed?
    turns_remaining.zero? || @filled_word == @guess_phrase
  end

  def guess!(letter)
    if guess_correct?(letter)
      @guess_phrase.each_char.each_with_index do |char, index|
        if letter == char
          @filled_word[index] = letter
        end
      end

      true
    else
      @turns_remaining -= 1

      false
    end
  end

  private

  def guess_correct?(letter)
    @guess_phrase.include?(letter)
  end
end
