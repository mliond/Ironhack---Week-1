class MoveReader
	def read_from_file
		letter_moves = IO.read("lib/simple_moves.txt").split("\n").map { |x| x.to_s.split(' ')}
		convert_coordinates(letter_moves)
	end

	def convert_coordinates(letter_moves)
		letter_conversion = {:a => 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7}
		number_conversion = {:"8" => 0, :"7" => 1, :"6" => 2, :"5" => 3, :"4" => 4, :"3" => 5, :"2" => 6, :"1" => 7}

		letter_moves.map! do |row|
			row.map! do |column|
				letter = column[0].gsub!(/[a-h]/) {|a| letter_conversion[a.to_sym]}
				number = column[1].gsub!(/[1-8]/) {|i| number_conversion[i.to_sym]}
				column = [letter + number].join
			end
		end
	end
end