class Person

attr_reader :name 
attr_accessor :age

	def initialize(name, age)
		@name = name
		@age = age
	end

end

kevin = Person.new("Kevin", 19)
anna = Person.new("Anna", 73)

kevin.age = 8

puts "#{kevin.age}" + " #{anna.name}"