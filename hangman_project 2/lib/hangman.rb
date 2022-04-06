
require "byebug"
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
  return DICTIONARY.sample
  end

  def initialize
    # debugger
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    return @guess_word
  end

  def attempted_chars
    return @attempted_chars
  end

  def remaining_incorrect_guesses
    return @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if attempted_chars.include?(char)
      return true
    else
      return false
    end
  end

  def get_matching_indices(char)
    array_index= []
    @secret_word.each_char.with_index do |c, i|
      if c == char
        array_index << i 
      end
    end
    return array_index
  end

  def fill_indices(char, array_index)
    array_index.each do |index|
    @guess_word[index] = char
    end
  end
# PART 2

  def try_guess(char)

  

    if self.already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
    
    @attempted_chars << char
    

    self.fill_indices(char,self.get_matching_indices(char))

    if get_matching_indices(char).length == 0
      @remaining_incorrect_guesses -= 1
    end
    return true
  end

  def ask_user_for_guess
    p 'Enter a char:'
    response = gets.chomp
    return try_guess(response)
  end

  def win?
    # debugger
    if @guess_word.join("")== @secret_word
      p 'WIN'
      return true
    end
    return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p 'LOSE'
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
