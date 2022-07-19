require_relative 'decorator'
require_relative 'person'

person = Person.new(22, 'maximilianus')
puts person.correct_name
capitalized_Person = CapitalizeDecorator.new(person)
puts capitalized_Person.correct_name
capitalized_Trimmed_Person = TrimmerDecorator.new(capitalized_Person)
puts capitalized_Trimmed_Person.correct_name
