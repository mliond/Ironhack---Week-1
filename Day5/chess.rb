require 'awesome_print'
require 'pry'

class ChessBoard
	def initialize(origin, destination)
		@origin = origin
		@dest = destination
	end

	def create_the_board
		@board = Array.new(8) { Array.new(8, "") }
		@board[0][0] = :bR
		@board[7][0] = :wR
		@board
	end

	def check_the_space
		# #horizontal check

		# horizontal_row = @board.map {|x,y| y[0]}
		# ap horizontal_row

		# #vertical check
		# @board.map {|v| v[0]}
	# 	@dest[1] - @origin[1].times do |i|
	# 		if @board[@dest[0]][i] == ""
	# 			puts "yo"
	# 		end
	# 	end
	# end

		if @board[@dest[0]][@dest[1]] == ""
			Rook.new(@origin, @dest).check_move
		else
			puts "SPACE TAKEN"
		end
	end
end

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
end

class Rook < ChessPiece
	def check_move
		if (left_right == true)
			puts "LEGAL MOVE"
		else
			puts "ILLEGAL MOVE"
		end
	end
end

class Queen < ChessPiece
	def check_move
		if (left_right == true)||((@dest[0] - @origin[0]).abs / (@dest[1] - @origin[1]).abs == 1)
			puts "LEGAL"
		else
			puts "ILLEGAL"
		end
	end
end





