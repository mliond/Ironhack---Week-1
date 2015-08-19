class Login

	def prompt_access
		puts "username:"
		@username = gets.chomp.to_s
		puts "password:"
		@password = gets.chomp.to_s
		evaluate_username
	end
	
	def evaluate_username
		if @username.upcase == "test".upcase && @password.upcase == "abcd".upcase
			puts "correct username & password"
			WordCounter.new.prompt_text
		else 
			puts "wrong username / password"
		end
	end

end


class WordCounter

	def prompt_text
		puts "Please enter your text to have the program count the words:"
		@text = gets.chomp
		self.count_words_in_text
	end

	def count_words_in_text
		puts "Number of words: #{@text.split.size}"
	end

end

login = Login.new
login.prompt_access 