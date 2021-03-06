require 'pry'

class Dog

    attr_accessor :name, :breed
    attr_reader :id

    def initialize(args)
        def initialize args
            args.each do |k,v|
              instance_variable_set("@#{k}", v) unless v.nil?
            end
        binding.pry

        @name = 
        breed = row[1]

        @id = id
       @name = name
       @breed = breed

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

    def save
        sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?);

        SQL
        data = DB[:conn].execute(sql, self.name, self.breed)
        new_id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
        self.id = new_id
        self
    end

    def self.new_from_db(row)
        #binding.pry
        id = row[0]
        name = row[1]
        breed = row[2]
        

        #id, name, breed = row
        self.new(id, name, breed)


    end

    def self.create(input_hash)
        #binding.pry
        #input_hash.each do |key, value|
         #   self.send("#{key}=", value)
          # end
        dog = Dog.new(input_hash)
        dog.save
        dog

    end

end