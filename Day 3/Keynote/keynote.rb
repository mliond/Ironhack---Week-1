require 'terminfo'

# class ReadInfo
#   def read_from_slides_file
#     puts File.open("slides.txt", "w") { |io|  }
# end
# end


class DBOperations
  attr_accessor :slide_text

    def read_text_from_file
      @arr = IO.read("slides.txt")
      split_the_read_text
    end

    def split_the_read_text
      @slide_text = @arr.split("\n----\n").to_a
    end
end

class ShowTime

  def initialize(slide_text)
    @slide_text = slide_text
  end

  def print_spaces
    i = 1
    num = 12
      while i < num  do
      puts""
      i +=1
      end
  end

  def create_all_slides_array
    all_of_the_slides_array = create_all_slides
    puts all_of_the_slides_array
  end

  def create_all_slides
    @slide_text.each do |1|
      print_spaces
      puts @slide_text[1]
      print_spaces
    end
  end

    def show_slide
    end

end

my_db = DBOperations.new
slide_text = my_db.read_text_from_file

my_showtime = ShowTime.new(slide_text)
my_showtime.create_all_slides_array