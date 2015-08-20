require 'pry'

class Room 

	attr_reader :id, :doors, :setting, :food, :inventory

	# Assigning the values of each room. 
	def initialize(id, doors, setting, food, inventory)
		@id = id
		@doors = doors
		@setting = setting
		@food = food
		@inventory = inventory	
	end
end

class Game
	def initialize
		@rooms = []
		@current = 0
		@player_inventory = []
		@input = ""
	end

	def add_rooms(room)
		@rooms.push(room)
		@rooms.sort_by { |room| room.id }
	end

	def describe_room
		puts "You are in a #{@rooms[@current].setting}. Choose what to do."
		
		unless @rooms[@current].inventory == "" || @player_inventory.include?(@rooms[@current].inventory)
			puts "You can see a #{@rooms[@current].inventory}."
		end

		puts "Exits: #{@rooms[@current].doors.join(", ")}"
		puts "<"
		ask_for_input
	end

	def ask_for_input
		@input = gets.chomp
		what_did_the_player_enter
	end

	def what_did_the_player_enter
		@cap_input = @input.upcase
		@last_word_input = @input.split.last 

		if @cap_input.include?("pick".upcase) || @cap_input.include?("drop".upcase)
			input_is_inventory
		elsif @rooms[@current].doors.include?(@cap_input) 
			input_is_direction
		elsif @cap_input == "inventory".upcase
			input_is_show_inventory
		elsif @cap_input == "exit".upcase
			input_is_exit_game
		elsif @cap_input == "save game".upcase
			input_is_save_game_state
		elsif @cap_input == "load game".upcase
			input_is_load_game_state
		elsif @cap_input == "help".upcase
			input_is_cry_for_help
		else
			input_is_no_command
		end
	end

	def input_is_inventory

		if @cap_input == "Pick up #{@rooms[@current].inventory}".upcase 
			puts "You picked up the #{@rooms[@current].inventory}."
			@player_inventory.push(@rooms[@current].inventory)
			puts "The inventory is #{@player_inventory}"
			ask_for_next_play
		elsif @player_inventory.include?("#{@last_word_input}")
			puts "You dropped the #{@last_word_input}."
			@player_inventory.delete(@last_word_input)
			#change replace to "add to" the current inventory
			@rooms[@current].inventory.replace(@last_word_input)
			puts "The inventory is #{@player_inventory}"
			ask_for_next_play	
		else 
			puts "error1"
		end

	end

	def input_is_direction
	
		if @cap_input == "N"
			@current = @current + 1
			ask_for_next_play	
		elsif @cap_input == "S"
			@current = @current - 1
			ask_for_next_play	
		elsif @cap_input == "W" && @current == 2
			@current = 4
			ask_for_next_play	
		elsif @cap_input == "E" && @current == 2
			@current = 5
			ask_for_next_play					
		elsif @cap_input == "E" && @current == 4
			@current = 2
			ask_for_next_play					
		elsif @cap_input == "W" && @current == 5
			@current = 2
			ask_for_next_play					
		else 
			puts "error2"
		end

	end

	def input_is_no_command
		puts "try again"
		ask_for_input
	end

	def input_is_show_inventory
		puts "The inventory is #{@player_inventory}"
		ask_for_next_play					
	end

	def input_is_save_game_state
		puts "You have saved the game in a file called 'savegame.txt' in your game's folder"
		IO.write("savegame.txt", "#{@current} #{@player_inventory}")
		ask_for_next_play
	end

	def input_is_load_game_state
		puts "You are loading your saved game from 'savegame.txt' in your game's folder"
		loaded_state = IO.read("savegame.txt")
		@current = loaded_state.split.first.to_i 
		@player_inventory = loaded_state.split.last
		ask_for_next_play
	end

	def input_is_cry_for_help
		puts "The possible commands are: directions (n, e, s, w), game states (load game, 
			save game), inventory (pick up item, drop item) or help."
	end

	def ask_for_next_play
		describe_room
	end

	def input_is_exit_game
	end

end

room1 = Room.new(0, ["N"], "forest", true, "sword")
room2 = Room.new(1, ["N", "S"], "city", false, "")
room3 = Room.new(2, ["N", "S", "E", "W"], "church", false, "")
room4 = Room.new(3, ["S"], "house", false, "")
room5 = Room.new(4, ["E"], "bar", false, "")
room6 = Room.new(5, ["W"], "restaurant", false, "")

my_game = Game.new
my_game.add_rooms(room1)
my_game.add_rooms(room2)
my_game.add_rooms(room3)
my_game.add_rooms(room4)
my_game.add_rooms(room5)
my_game.add_rooms(room6)

my_game.describe_room


