class Zoo
  attr_accessor :cages
  attr_reader :employees
  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    10.times { @cages << Cage.new }
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date > @season_opening_date && date < @season_closing_date
  end

  def add_animal(animal)
    added = false

    @cages.each do |cage|
      if cage.empty? && !added
        cage.animal = animal
        added = true
      end
    end
    raise ZooAtCapacity, "zoo at capacity" unless added
  end

  def visit
    result = ""
    @employees.each do |employee|
      result += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      result += "#{cage.animal.speak}\n" unless cage.empty?
    end
    result
  end
end

class ZooAtCapacity < NameError
end
