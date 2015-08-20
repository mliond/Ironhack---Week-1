class FizzBuzz

  def initialize(goal)
    @goal = goal
    @numbers = (1..@goal).to_a
  end

  def run_game(hash, my_lambda)
    new_numbers = @numbers.map do |number|
      my_lambda.call(hash, number)
    end
    puts new_numbers
  end
end

hash = {3 => "fizz", 5 => "buzz", 7 => "blue"}

my_lambda = -> (hash, number) do
  result = ""
  hash.each do |key, value|
    if number%key == 0
      result += value
    end
  end
  if result != ""
    return result
  else
    return number
  end
end

FizzBuzz.new(100).run_game(hash, my_lambda)