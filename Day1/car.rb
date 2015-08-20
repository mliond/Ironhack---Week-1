class Car

	@@number_of_cars = 0

	attr_reader :noise 

	def initialize(noise)
		@@number_of_cars += 1
		@noise = noise
		IO.write("file.txt", @@number_of_cars)
	end

	def make_noise
		puts @noise 
	end

end

class SuperLoudCar < Car

	def initialize
		@noise = "BROOOOOOOOOM"
	end

end

new_car = Car.new("Beep")
loud_car = Car.new("Broom")
super_loud_car = SuperLoudCar.new

all_cars = [new_car, loud_car, super_loud_car]

# all_cars.each do |item|
# 	item.make_noise
# end

sounds = ["Broom", "Meek", "Nyan"]

# new_cars = sounds.map do |sound|
#	Car.new(sound)
# end

# print new_cars

# dict = sounds.each_with_object({}) {|item, memo| memo[item] = Car.new(item) }

# puts dict

reduction = all_cars.reduce("") { | sum, car | sum + car.noise }

puts reduction