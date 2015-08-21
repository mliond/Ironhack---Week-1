require "./MoveReader"

class ChessValidator
	def create_board(origin, destination)
		my_board = ChessBoard.new(origin, destination)
		my_board.create_the_board
		space_free = my_board.check_the_space
	end

	def loop_this(commands)

end