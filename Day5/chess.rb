require 'awesome_print'
require 'pry'

class ChessBoard
	def initialize
	end

	def create_the_board
		@board = Array.new(8) { Array.new(8, 0) }
		@board[0][0] = :bR
		@board[7][0] = :wR
		# ap @board[0, 0].to_s
	end

	def check_the_space(x, y)
		if @board[x][y] == nil
			return true
		else
			return false
		end
	end
end

class Rook
	def check_move(board, origin, destination)
		originx = origin[0]
		originy = origin[1]
		destinationx = destination[0]
		destinationy = destination[1]

		if ((originx == destinationx) && (originy != destinationy)) || ((originx != destinationx) && (originy == destinationy))
			puts "yo"
		else
			puts "error"
		end
	end
end

my_board = ChessBoard.new.create_the_board
# my_board.check_the_space(0, 0)
Rook.new.check_move(my_board, [7,1], [3,7])