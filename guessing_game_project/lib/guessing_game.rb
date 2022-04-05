class GuessingGame
    def initialize(min,max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    def num_attempts
        return @num_attempts
    end
    def game_over?
        return @game_over
    end
    def check_num(num)
        @num_attempts += 1 
        if num == @secret_num
            @game_over = true
            p 'you win'
        elsif num > @secret_num
            p 'too big'
        else 
            p 'too small'
        end
    end
    def ask_user
        p 'enter a number'
        number = gets.chomp
        check_num(number.to_i)
    end
end
