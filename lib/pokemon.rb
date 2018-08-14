require 'pry'
class Pokemon

attr_accessor :id, :name, :type, :db


def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db

end


def self.save(name, type, db)
  #binding.pry
  "CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT);"
  insert_into = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)") #if we interpolate we actually make it vulnerbale to attacks

  #binding.pry
  insert_into.execute(name, type)
end

def self.find(id, db)
  #we write a select statement to find the query
  query = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  array = query.flatten
  #binding.pry

  pokemon1 = Pokemon.new(id: array[0], name: array[1], type: array[2], db: db)
  #binding.pry
end







end #end of pokemon class
