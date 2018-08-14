class Pokemon

attr_accessor :id, :name, :type, :db, :hp

@@all = []

def initialize(id:, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  @hp = hp
  @@all << self
end


def self.all
  @@all
end

def self.save(name, type, db)
  # Pokemon.new(id:id , name:"Pikachu", type:"electric", db:db)
  # pokemon.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
  db.execute "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type]
end


# def self.find(id, db)
#   pokemon_array = db.execute ("SELECT pokemon.name, pokemon.type FROM pokemon WHERE id = pokemon.id")
#   my_new_pokemon = Pokemon.new(id: id, name: pokemon_array[0][0], type: pokemon_array[0][1], db: db)
#   #binding.pry
# end


def self.find(id, db)
   pokemon_array = db.execute "SELECT * FROM pokemon WHERE id == id"
   flatten_array = pokemon_array.flatten
   #binding.pry
   Pokemon.all.find do |pokemon|
     pokemon.id == flatten_array[0]
   end
 end



def alter_hp(new_hp, db)
 db.execute("UPDATE pokemon SET hp=(?) WHERE name=(?)")
 self.hp = new_hp
end
#binding.pry

end # end of Pokemon Class
