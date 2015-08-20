class FizzBuzz
  def run_game(key_hash, my_lambda)
    new_numbers_arr = (1..100).to_a.map do |number|
      my_lambda.call(key_hash, number)
    end
    puts new_numbers_arr
  end
end

key_hash = {3 => "fizz", 5 => "buzz", 7 => "blue"}

my_lambda = -> (key_hash, number) do
  result = ""

  key_hash.each do |key, value|
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

FizzBuzz.new.run_game(key_hash, my_lambda)
