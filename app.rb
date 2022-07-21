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
            


end
