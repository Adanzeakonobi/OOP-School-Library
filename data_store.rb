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