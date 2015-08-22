require 'awesome_print'

# require './lib/chess'
require_relative "lib/MoveReader"
require_relative "lib/ChessBoard"
require_relative "lib/ChessValidator"

# ChessValidator.new.convert_coordinates("a8", "e8")
board = ChessBoard.new.create_the_board
coordinates = MoveReader.new.read_from_file
ChessValidator.new(board, coordinates).loop