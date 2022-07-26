require 'json'
require_relative 'person'
require_relative 'book_options'
require_relative 'people_options'
require_relative 'rental_options'
require_relative 'rental'
require_relative 'book'

module DataStore
    def save_data(filename, data)
        file.open(filename, 'w') do |file|
            file.puts data.to_json
        end
    end

    def load_data(filename)
        JSON.parse(file.read(filename))
    end

    def save_person
        data = []
        @people.each do |person|
            if person.instance_of?(Teacher)
                data << ({key: 'teacher', id: person.id, age: person.age, name: person.name, specialization: person.specialization})
            else
                data << ({key: 'teacher', id: person.id, age: person.age, name: person.name, parent_permission: person.parent_permission, classroom: person.classroom.label})
            end
            save_data('person.json', data)
        end
    end

    def save_rentals
        data = []
        @rentals.each do |rental|
            data << ({date: rental.date, book: rental.book.id, person: rental.person.id})
            save_data('rental.json', data)
        end
    end

    def save_books
        data = []
        @books.each do |book|
            data << ({title: book.title, author: book.author})
            save_data('books.json', data)
        end
    end

def load_people
    filename = 'person.json'
    if file.exist? filename
        data = load_data(filename)
        data.each do |person|
            if person['key'] == 'Teacher'
                Teacher.new(person['specialization'], person['age'], person['name'])
            else
                Student.new(person['classroom'], person[age], person['name'], person['parent_permission'])
            end
        end
    else
        []
    end
end

def load_books
    filename = 'books.json'
    if File.exist? filename
      data = load_data(filename)
      data.each do |book|
        Book.new(book['title'], book['author'] )
      end
    else
      []
    end
end

