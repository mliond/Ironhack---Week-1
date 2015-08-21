# require './lib/chess'
require_relative "lib/MoveReader"

# ChessValidator.new.convert_coordinates("a8", "e8")
MoveReader.new.read_from_file