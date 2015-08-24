require 'awesome_print'
require 'pry'

class ChessBoard
	def create_the_board
		board = Array.new(8) { Array.new(8, "") }
		board[0][0] = :bR
		# board[0][7] = :bR
		board[7][0] = :wR
		# board[7][7] = :wR
		# board[0][4] = :bQ
		# board[7][4] = :wQ

		# these are for testing, not from the given board
		board[0][6] = :bR
		board[1][0] = :bQ
		# until here
		board
	end
end

