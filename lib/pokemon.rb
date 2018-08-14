class Pokemon
  attr_reader :id, :name, :type, :db
  attr_accessor :hp

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_row = db.execute("SELECT * FROM pokemon WHERE id=id").flatten
    @@all.find do |pokemon|
      pokemon.id == pokemon_row[0]
    end
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp=(?) WHERE name=(?)", new_hp, self.name)
    self.hp = new_hp
  end

end
