require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'

class App
    def initialize
        @people
        @books
        @rentals

    end

    def menu
        puts
        puts 'Please choose an option by entering a number'
        puts '1 - List all books'
        puts '2 - List all people'
        puts '3 - Create a person'
        puts '4 - Create a book'
        puts '5 - Create a rental'
        puts '6 - List all rentals for a given person id'
        puts '7 - Exit'
    end

    def start
        puts 'Welcome to school library'
        loop do
            menu
            option = gets.chomp
            break if option == '7'

            get_option(option)
        end
        puts 'Thank you for using our library!'
    end

        def get_option(option)
            case option
            when '1'
                list_all_books
            when '2'
                list_all_people
            when '3'
                create_person
            when '4'
                create_book
            when '5'
                create_rental
            when '6'
                list_rentals_by_person_id
            else
                puts 'Thank you for using this App!'
            end
        end

        def list_all_books
            puts 'There are no books yet!.' if @books.empty?
        
            @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
            sleep 0.75
        end

        def list_all_people
            puts 'There is not a person yet!.' if @people.empty?
            @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
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
            end
            puts 'Person created successfully!'
            puts 'Press enter to continue..!'
            gets
            run
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
        
            puts 'Student created successfully'
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

          def create_book
            print 'Title: '
            title = gets.chomp
        
            print 'Author: '
            author = gets.chomp
        
            book = Book.new(title, author)
            @books << book
        
            puts 'Book added successfully'
            sleep 0.75
          end
        end

        def create_rental
            puts 'Select a book from the following list by number'
            @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
          
            book_id = gets.chomp.to_i
          
            puts 'Select a person from the following list by number (not id)'
            @people.each_with_index do |person, index|
              puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
            end

            person_id = gets.chomp.to_i
            
            print 'Date: '
            date = gets.chomp.to_s
            
            rental = Rental.new(date, @books[book_id], @people[person_id])
            @rentals << rental
            
            puts 'Rental created successfully'
            sleep 0.75
        end


end
