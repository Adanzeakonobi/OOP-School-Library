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
                data << ({key: 'teacher', id: person.id, age: person.age, name: person.name, parent_permission: person.parent_permission, classroom: person.classroom})
            end
            save_data('person.json', data)
        end
    end
end