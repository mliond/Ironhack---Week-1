class Car 
	def initialize(engine, sound)
		@engine = engine
		@sound = sound
	end

	def start
		puts "#{@sound} #{@engine.sound}"
	end
end

class Engine

	attr_reader :sound 

	def initialize(sound)
		@sound = sound 
	end

end

class ElectricEngine < Engine 
end

engine = Engine.new("Wroom")
eengine = ElectricEngine.new("---")
Car.new(engine, "Pshhh").start
Car.new(eengine, "Pshhh").start
