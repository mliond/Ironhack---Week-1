class CorrectAccessData

	attr_reader :correct_username, :correct_password

	def initialize(hardcode_or_file)
		@hardcode_or_file = hardcode_or_file.upcase
	end

	def get_correct_access_data
		if @hardcode_or_file = "file".upcase
			read_correct_user_and_password_from_file
		elsif @hardcode_or_file = "hardcode".upcase
			hardcode_correct_user_and_password
		else
			puts "error0"
		end
	end

	def read_correct_user_and_password_from_file
		read_data = IO.read("access_data.txt").to_s
		@correct_username = read_data.split.first
		@correct_password = read_data.split.last
	end
	
	def hardcode_correct_user_and_password
		@correct_username = "test"
		@correct_password = "abcd"
	end
end

class Login
	def initialize access_data
		@access_data = access_data
	end

	def prompt_for_user_and_password
		puts "username:"
		@username = gets.chomp.to_s
		puts "password:"
		@password = gets.chomp.to_s
		evaluate_username
	end

	def evaluate_username
		if @username.upcase == @access_data.correct_username.upcase && @password.upcase == @access_data.correct_password.upcase
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

#Put file or hardcode to switch methods 
my_correct_access_data = CorrectAccessData.new("file")
my_correct_access_data.get_correct_access_data

login = Login.new(my_correct_access_data)
login.prompt_for_user_and_password 