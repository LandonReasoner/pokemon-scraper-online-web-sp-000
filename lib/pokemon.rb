class Pokemon
  attr_reader :id, :name, :type, :db, :hp 
  
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id 
    @name = name 
    @type = type 
    @db = db
    @hp = hp 
    @@all << self 
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end 
  
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    hp = pokemon[3]
    
    Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end
  
end
