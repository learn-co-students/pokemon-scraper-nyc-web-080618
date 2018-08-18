require 'pry'

class Pokemon
  attr_accessor :hp, :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?",id)[0]
    pokemon = Pokemon.new(id: id, name: poke[1], type: poke[2], db: db)
    pokemon.hp = poke[3]
    pokemon
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end

# binding.pry
