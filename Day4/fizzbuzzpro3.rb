class Fizzbuzz
  def run_game(hash, my_lambda)
    number_array = (1..100).to_a.map do |number|
      my_lambda.call(hash, number)
    end
    puts number_array
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

  unless result == ""
    return result
  else
    return number
  end
end

Fizzbuzz.new.run_game(hash, my_lambda)