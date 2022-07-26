require_relative 'rental_options'
require_relative 'data_store'

class BookOptions
  attr_reader :books

  def initialize
    @books = []
  end

  def list_all_books
    puts 'There are no books yet!.' if @books.empty?

    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
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
