class Car
  attr_reader :speed

  def initialize(speed)
    @speed = speed
  end
end

class DB
  def save(variable)
    DB.sql("MESSAGE #{variable.speed}")
  end
end

my_car = Car.new(150)
my_DB = DB.new

my_DB.save(my_car)