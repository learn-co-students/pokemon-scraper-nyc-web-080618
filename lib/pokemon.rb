require "pry"

class Pokemon
  attr_reader :id, :name, :type, :db
  attr_accessor :hp
  @@all = []
  def initialize(name:, type:, db:, id:, hp:)
    @db = db
    @name = name
    @type = type
    @id = id
    @hp = hp
    @@all << self
    end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    a = db.execute("SELECT * FROM Pokemon WHERE id = ?", id)
    #binding.pry
    mypokemon = Pokemon.new(name: a[0][1], type: a[0][2], hp: a[0][3], db: db, id: id)
    #binding.pry
    mypokemon
  end
#   def self.save(name, breed, age, database_connection)
#   database_connection.execute("INSERT INTO cats (name, breed, age) VALUES (?, ?, ?)",name, breed, age)
# end
  def alter_hp(new_hp, db)
    a = db.execute("UPDATE pokemon SET HP = ? WHERE id = ?", new_hp, self.id)
    #b = db.execute("SELECT * FROM Pokemon WHERE id = ?", self.id)
    b = Pokemon.find(self.id, db)
    #binding.pry
    b.hp
    #binding.pry

  end


end #end of class
