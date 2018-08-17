class Pokemon
  attr_accessor :id,:name,:db,:type,:hp
  def initialize(name:,id:,type:,db:)
    @name=name
    @id=id
    @type=type
    @hp=60
  end

  def self.save (name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    p=db.execute("SELECT*FROM pokemon WHERE id= ?",id)[0]
    poke=Pokemon.new(name:p[1],id:id,type:p[2],db:db)
    poke.hp=p[3]
    poke 
  end

  def alter_hp(hp,db)
    @hp=hp
    db.execute("update pokemon set hp=? where id=?",hp,self.id)
  end


end
