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
    @movies_txt.split("\n").to_a
  end
end

class LookOnImdb
  def initialize(movies_arr)
    @movies_arr = movies_arr
  end

  def look_for_rating
    @ratings_arr = @movies_arr.map {|n| Imdb::Search.new(n).movies[0].rating}
    round_ratings
  end

  def round_ratings
    @ratings_arr.map {|rating| rating.to_i.round}
  end
end

class LayoutBuilder
  def initialize(movies_arr, ratings_arr)
    @movies_arr = movies_arr
    @ratings_arr = ratings_arr
  end

  def build_ratings_vertically
		10.downto(1) do |i|
		print "|"
		@ratings_arr.each do |rating|
			if rating >= i
				print "#|"
			else
				print " |"
			end
			end
			puts ""
		end
	end

  def build_number_of_movies
  	@string = "|"
  	@ratings_arr.each_index do |position|
  		@string += "#{position + 1}|"
  	end
  	@string
  end

  def build_dashes
		"-" * build_number_of_movies.length
	end

  def build_list_of_movies
		@movies_arr.each_with_index {|title, index| puts "#{index + 1}. #{title}"}
	end

	def build_layout
		build_ratings_vertically
		puts build_dashes
		puts build_number_of_movies
		puts ""
		build_list_of_movies
	end
end

movies_arr = TextReader.new.read_from_file
ratings_arr = LookOnImdb.new(movies_arr).look_for_rating
LayoutBuilder.new(movies_arr, ratings_arr).build_layout