

def create_code
    nums = [0..9]
    nums.sample(4)
end

def round
    puts "Enter your guess:"
    guess = gets.chomp.split(" ")
end