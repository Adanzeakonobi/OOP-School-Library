class PeopleOptions
  attr_reader :person

  def initialize
    @people = []
  end

  def list_all_people
    puts 'There is not a person yet!.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    sleep 0.75
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    person_option = gets.chomp

    case person_option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Incorrect input please use 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(@classrooms, age, name, parent_permission)
    @people << student

    puts 'Person created successfully!'
    sleep 0.75
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @people << teacher

    puts 'Teacher created successfully'
    sleep 0.75
  end
end
