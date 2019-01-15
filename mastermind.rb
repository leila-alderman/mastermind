class Game
    def initialize
        @code = create_code()
    end

    def create_code
        nums = [0..9]
        nums.sample(4)
    end

    def round(turn)
        puts "Enter your guess:"
        guess = gets.chomp.split(" ")
        return if guess == 'q'
        check(guess)
        puts "Sorry -- you're out of guesses. Game over." if turn == 12
    end

    def check(guess)
        right_position = 0
        right_value = 0
        for i in 0..(guess.length-1)
            if guess[i] == @code[i]
                right_position += 1
            end
            if @code.include?(guess[i])
                right_value += 1
            end
        end
        right_value -= right_position
        puts "Your guess had #{right_position} #{pluralize(right_position, "number")} with the correct value in the correct position and #{right_value} #{pluralize(right_value, "number")} with the correct value but in the wrong position."
        winner?(right_position)
    end

    def winner?(number)
        if number == 4
            puts "Congrats! You win!"
        end
    end

    def play_game
        puts "Welcome to Mastermind!"
        puts "The computer has a secret code that consists of four unique digits. Can you guess them all correctly?"
        puts "You have 12 rounds to try to guess the correct digits in the correct order."
        puts "Enter your guesses in the format '1 2 3 4'."
        puts "To quit the game, enter 'q'."
        for turn in 1..12
            round(turn)
        end

    end

    private
    def pluralize(number, text)
        return "#{text}s" if number != 1
        text
    end
end

game = Game.new
game.play_game
