require 'awesome_print'

class MoveReader
	def read_from_file
		# simple_moves = IO.read("simple_moves.txt").split("\n")
		# simple_moves2 = simple_moves.map { |x| x.to_s.split(' ')}
		# convert_coordinates(simple_moves2)
		puts "yo"
	end
end


	# def convert_coordinates(simple_moves2)
	# 	letter_conversion = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5, g: 6, h: 7}
	# 	number_conversion = {:"8" => 0, :"7" => 1, :"6" => 2, :"5" => 3, :"4" => 4, :"3" => 5, :"2" => 6, :"1" => 7}

	# 	letter_origin = origin.split("").map! {|x| x.to_sym}
	# 	letter_destination = destination.split("").map! {|x| x.to_sym}

	# 	number_origin = [letter_conversion[letter_origin[0]], number_conversion[letter_origin[1]]]
	# 	number_destination = [letter_conversion[letter_destination[0]], number_conversion[letter_destination[1]]]

	# 	create_board(number_origin, number_destination)
	# end
