require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(nameIn, typeIn, dbIn)
    dbIn.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
    dbIn.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", nameIn, typeIn)
  end

  def self.find(id, db)
    myArray = db.execute("SELECT pokemon.name, pokemon.type FROM pokemon WHERE id = pokemon.id")
    myPokemon = Pokemon.new(id: id, name: myArray[0][0], type: myArray[0][1], db: db)
  end

  def self.all
    @@all
  end

end

#binding.pry
