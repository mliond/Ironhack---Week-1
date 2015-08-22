require 'awesome_print'
require 'pry'

class ChessBoard
	def create_the_board
		board = Array.new(8) { Array.new(8, "") }
		board[0][0] = :bR
		board[7][0] = :wR
		board
	end
end

