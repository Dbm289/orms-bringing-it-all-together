require 'pry'

class Dog

    attr_accessor :name, :breed, :db
    attr_reader :id

    @@all = []

    def initialize(input_hash)
       input_hash.each do |key, value|
        self.send("#{key}=", value)
       end
       @id = id

    end

    def self.create_table
        sql = <<-SQL
        CREATE TABLE IF NOT EXISTS dogs (
            id INTEGER PRIMARY KEY,
            name TEXT,
            breed TEXT

        )
        SQL
        DB[:conn].execute(sql)

    end

    def self.drop_table
        sql = <<-SQL
        DROP TABLE IF EXISTS dogs;
        SQL

        DB[:conn].execute(sql)

    end

    def self.all_instances
        @@all

    end

    def self.all
        sql = <<-SQL
        SELECT * FROM dogs
        SQL
        data = DB[:conn].execute(sql)
        data.map do |dog_hash|
            Dog.new(dog_hash)
        end

    end

    def save
        sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?);

        SQL
        data = DB[:conn].execute(sql, self.name, self.breed)
    end

    def self.new_from_db(row
        id, name, breed = row
    self.new(name, breed, id)


    end

    def self.create(input_hash)
        dog = Dog.new(name, breed)
        dog.save
        dog

    end

end