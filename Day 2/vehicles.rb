class Vehicle
	attr_accessor :wheels, :noise 

	def initialize(wheels, noise)
		@wheels = wheels
		@noise = noise
	end

end

class CountWheels

	def initialize(array)
		@array = array
	end

	def count
		@array.reduce(0) { |sum, item| sum + item.wheels }
	end
end



class ListNoise

	def initialize(array)
		@array = array
	end

	def list
		@array.reduce("") { |sum, item| sum + item.noise }
	end
end


car = Vehicle.new(5, "A")
bike = Vehicle.new(2, "B")
bus = Vehicle.new(14, "C")

vehicles = [car, bike, bus]

number_of_wheels = CountWheels.new(vehicles).count
puts number_of_wheels

noise_list = ListNoise.new(vehicles).list
puts noise_list