require 'awesome_print'
require 'rubygems'
require 'imdb'
require 'pry'

class TextReader
  def read_from_file
    @movies_txt = IO.read("movies.txt")
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

  def look_for_rating
    @ratings_arr = @movies_arr.map do |n|
      i = Imdb::Search.new(n).movies[0].rating
    end
    round_ratings
  end

  def round_ratings
    @rounded_ratings = @ratings_arr.map {|rating| rating.to_i.round }
    @rounded_ratings
  end
end

class LayoutBuilder
  def initialize(movies_arr, ratings_arr)
    @movies_arr = movies_arr
    @ratings_arr = ratings_arr
  end

  def build_ratings
	  @ratings_arr.each do |n|
    	puts "|" + "#|\n" * n
    end
  end

end

movies_arr = TextReader.new.read_from_file
ratings_arr = LookOnImdb.new(movies_arr).look_for_rating
LayoutBuilder.new(movies_arr, ratings_arr).build_ratings