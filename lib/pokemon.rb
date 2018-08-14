require 'pry'
class Pokemon
attr_reader :name, :type, :id, :db

@@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    # @hp = 60
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon (id INTEGER PRIMARY KEY, name TEXT, type TEXT);")
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    this_pokemon = db.execute("SELECT * FROM pokemon WHERE id = '#{id}';")
    this_pokemon = this_pokemon.flatten
    Pokemon.new(id:this_pokemon[0], name:this_pokemon[1], type:this_pokemon[2], db:db)
  end

end
