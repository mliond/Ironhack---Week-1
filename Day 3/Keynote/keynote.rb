require 'terminfo'

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
    @slide_number = 0
  end

  def change_slide_number(item)
    @slide_number = @slide_number + item
    create_a_slide
  end

  def create_empty_lines
    i = 1
    num = 11
      while i < num  do
      puts""
      i +=1
      end
  end

  def create_center_line
    # @empty_spaces = (80 - @slide_text[0].length) / 2
    text = @slide_text[@slide_number]
    @centered_line = text.center(80, " ")
  end

  def create_a_slide
    puts create_empty_lines
    puts create_center_line
    puts create_empty_lines
    prompt_for_command
  end

  def prompt_for_command
    puts @slide_number + 1
    @next_or_previous = gets.chomp.upcase
    evaluate_prompt_for_command
  end

  def evaluate_prompt_for_command
    if @next_or_previous == "next".upcase
      change_slide_number(1)
    elsif @next_or_previous == "previous".upcase
      change_slide_number(-1)
    else
      puts "error0"
    end
  end


end

my_db = DBOperations.new
slide_text = my_db.read_text_from_file

my_showtime = ShowTime.new(slide_text)
my_showtime.create_a_slide