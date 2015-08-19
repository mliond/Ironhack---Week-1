class Input

	def prompt_username
		puts "username:"
		username = gets.chomp
	end

	def prompt_password
		puts "password:"
		password = gets.chomp
	end

	def evaluate_username
		if username.upcase == "test".upcase && password.upcase == "abcd".upcase
			puts "correct username & password"
			# go on to other method
		else 
			puts "wrong username / password"
		end
	end
end

class WordCounter

	def prompt_text
		puts "Please enter your text to have the program count the words:"
		text = gets.chomp
	end

	def count_words_in_text
		puts text.split.size
	end

end

