class WordAcrobatics

	def ask_for_input
		puts "Hello. Please provide a text:"
		@text = gets.chomp
		show_menu
	end

	def show_menu
		puts "What would you like me to do with your text (A: count words, B: count letters, C: reverse the text, 
			D: convert to uppercase, E: convert to lowercase)?"
		@user_choice = gets.chomp.upcase
		evaluate_choice
	end

	def evaluate_choice

		if (@user_choice == "a".upcase)||(@user_choice == "count words".upcase)
			@final_text = @text.split.size
		elsif (@user_choice == "b".upcase)||(@user_choice == "count letters".upcase)
			@final_text = @text.delete(" ").length
		elsif (@user_choice == "c".upcase)||(@user_choice == "reverse the text".upcase)
			@final_text = @text.reverse
		elsif (@user_choice == "d".upcase)||(@user_choice == "convert to uppercase".upcase)
			@final_text = @text.upcase
		elsif (@user_choice == "e".upcase)||(@user_choice == "convert to lowercase".upcase)
			@final_text = @text.downcase
		else 
			puts "please provide a valid command"
			show_menu
		end

		show_final_text
	end

	def show_final_text
		puts @final_text
	end

end

word_acrobatics = WordAcrobatics.new
word_acrobatics.ask_for_input
