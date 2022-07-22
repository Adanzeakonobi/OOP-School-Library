require_relative 'corrector'
# require_relative 'nameable'
require './decorator'
require_relative 'rental'

class Person
  attr_reader :id, :corrector
  attr_accessor :name, :age, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission = 'true')
    # super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  # def correct_name
  #   @name
  # end

  private

  def of_age?
    @age >= 18
  end
end
