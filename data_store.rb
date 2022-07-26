require 'json'

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

    def save_books
        data = []
        @books.each do |book|
            data << ({title: book.title, author: book.author})
            save_data('books.json', data)
    end
end


