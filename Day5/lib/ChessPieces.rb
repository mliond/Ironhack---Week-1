class ChessPiece
	def initialize(origin, destination)
		# @board = board
		@origin = origin
		@dest = destination
	end

	def left_right
		if (@origin[0] == @dest[0] && @origin[1] != @dest[1])||(@origin[0] != @dest[0] && @origin[1] == @dest[1])
			return true
		end
	end

	def diagonal
		if ((@dest[0] - @origin[0]).abs / (@dest[1] - @origin[1]).abs == 1)
			return true
		end
	end

	def evaluate_test(result)
		if result == true
			puts "yo"
		else
			puts "no"
		end
	end
end

class Rook < ChessPiece
	def check_move
		if (left_right == true)
			result = true
		else
			result = false
		end

		evaluate_test(result)
	end
end

class Queen < ChessPiece
	def check_move
		if (left_right == true)||(diagonal == true)
			result = true
		else
			result = false
		end

		evaluate_test(result)
	end
end