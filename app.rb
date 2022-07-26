require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require_relative 'book'
require_relative 'classroom'
require_relative 'people_options'
require_relative 'book_options'
require_relative 'rental_options'

class App
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

  def run
    # get_new = Option.new
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
    @people_options = PeopleOptions.new
    @book_options = BookOptions.new
    @rental_options = RentalOptions.new
    case option
    when '1'
      @book_options.list_all_books
    when '2'
      @people_options.list_all_people
    when '3'
      @people_options.create_person
    when '4'
      @book_options.create_book
    when '5'
      @rental_options.create_rental
    when '6'
      @rental_options.list_rentals_by_person_id
    else
      puts 'Thank you for using this App!'
    end
  end
end
