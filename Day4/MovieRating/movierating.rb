require 'awesome_print'
require 'imdb'
require 'pry'

class TextReader
  def read_from_file
    movies_txt = IO.read("movies.txt")
    @movies_txt
    turn_into_arr
  end

  def turn_into_arr
    movies_arr = @movies_txt.split("\n").to_a
    movies_arr
  end
end

class LookOnImdb
  def initialize(movies_arr)
    @movies_arr = movies_arr
  end

  def look_on_imdb
    i = movies_arr[0]
    puts i.movies.rating
  end
end

movies_arr = TextReader.new.read_from_file
LookOnImdb.new(movies_arr).look_on_imdb