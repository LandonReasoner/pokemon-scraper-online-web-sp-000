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
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", )
  end 
  
  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = (?);
    SQL
    pokemon = db.execute(sql, [id]).flatten
    Pokemon.new(id, pokemon[1], pokemon[2], pokemon[3], db)
  end
  
  def alter_hp(new_hp)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?;
    SQL
    db.execute(sql, [new_hp, id])
  end
  
end
