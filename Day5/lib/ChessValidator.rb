require 'pry'

require_relative "./ChessPieces"

class ChessValidator
	def initialize(board, coordinates)
		@board = board
		@coordinates = coordinates
	end

	def loop
		#central loop which splits the coordinates in origin and dest and then runs the test
		@coordinates.each do |x|
			origin = [x[0]]
			dest = [x[1]]
			which_figure?(origin, dest)
		end
	end

	def which_figure?(origin, dest)
		figure = @board[origin[0][0].to_i][origin[0][1].to_i][1]

		case figure
			when "R"
				Rook.new(origin, dest).check_move
			when "Q"
				Queen.new(origin, dest).check_move
			else
				puts "undefined"
		end
	end

	def is_the_way_free?
		# 	#horizontal check



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

# 		if @board[@dest[0]][@dest[1]] == ""
# 			Rook.new(@origin, @dest).check_move
# 		else
# 			puts "SPACE TAKEN"
# 		end
	end
end