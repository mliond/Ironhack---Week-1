require 'terminfo'

class DBOperations
  attr_accessor :slide_text

    def read_text_from_file
      @arr = IO.read("slides.txt")
      split_the_read_text_into_array
    end

    def split_the_read_text_into_array
      @arr.split("\n----\n").to_a
    end
end

class SlideBuilder

  def initialize(slide_text, slide_number)
    @slide_text = slide_text
    @slide_number = slide_number
  end

  def create_empty_lines
    i = 1
    num = 12
      while i < num  do
        puts""
        i +=1
      end
  end

  def create_center_line
    @slide_text[@slide_number].center(80, " ")
  end

  def create_a_slide
    # I can't get rid of the puts somehow
    puts create_empty_lines
    puts create_center_line
    puts create_empty_lines
    print @slide_number + 1
    prompt_for_command
  end

  def prompt_for_command
    @next_or_previous = gets.chomp.upcase
    evaluate_prompt_for_command
  end

  def evaluate_prompt_for_command
    if @next_or_previous == "next".upcase
      change_slide_number(1)
    elsif @next_or_previous == "previous".upcase
      change_slide_number(-1)
    end
  end

  def change_slide_number(change)
    @slide_number = @slide_number + change
    return @slide_number
  end
end

slide_text = DBOperations.new.read_text_from_file
presentation = ShowTime.new(slide_text)

presentation.create_a_slide