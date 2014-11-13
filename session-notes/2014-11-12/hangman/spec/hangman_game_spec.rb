require_relative '../hangman_game'

describe HangmanGame do
  describe '#initialize' do
    it 'accepts a single argument' do
      expect {
        HangmanGame.new('cat')
      }.to_not raise_error
    end

    it 'raises an error if guess phrase is empty' do
      expect {
        HangmanGame.new('')
      }.to raise_error
    end
  end

  describe '#filled_word' do
    context 'when the game is fresh' do
      it 'returns 4 blanks for a 4-letter word' do
        game = HangmanGame.new('cats')
        expect(game.filled_word).to eq('____')
      end

      it 'returns 5 blanks for a 5-letter word' do
        game = HangmanGame.new('horse')
        expect(game.filled_word).to eq('_____')
      end

      it 'does not return non-word characters as spaces' do
        game = HangmanGame.new('"Hello," she said.')
        expect(game.filled_word).to eq('"_____," ___ ____.')
      end
    end
  end

  describe '#completed?' do
    context 'when the game is fresh' do
      it 'returns false' do
        game = HangmanGame.new('cats')
        expect(game.completed?).to eq(false)
      end
    end
  end

  describe '#turns_remaining' do
    context 'when the game is fresh' do
      it 'returns 10' do
        game = HangmanGame.new('cats')
        expect(game.turns_remaining).to eq(10)
      end
    end
  end

  describe '#guess!' do
    context 'when the phrase contains our guess' do
      it 'does not change turns remaining' do
        game = HangmanGame.new('cats')

        expect {
          game.guess!('a')
        }.to_not change(game, :turns_remaining)
      end

      it 'updates filled word' do
        game = HangmanGame.new('a good dog')

        expect {
          game.guess!('o')
        }.to change(game, :filled_word).from('_ ____ ___').to('_ _oo_ _o_')
      end

      it 'returns true' do
        game = HangmanGame.new('cats')
        expect(game.guess!('a')).to eq(true)
      end

      it 'sets completed? to true after enough correct guesses' do
        game = HangmanGame.new('hi')

        expect {
          game.guess!('h')
          game.guess!('i')
        }.to change(game, :completed?).from(false).to(true)
      end
    end

    context 'when the phrase does not contain our guess' do
      it 'decrements turns remaining by 1' do
        game = HangmanGame.new('cats')

        expect {
          game.guess!('z')
        }.to change(game, :turns_remaining).by(-1)
      end

      it 'returns false' do
        game = HangmanGame.new('cats')
        expect(game.guess!('z')).to eq(false)
      end

      it 'sets completed? to true after too many bad guesses' do
        game = HangmanGame.new('cats')
        turns = game.turns_remaining

        expect {
          turns.times { game.guess!('z') }
        }.to change(game, :completed?).from(false).to(true)
      end
    end
  end
end
