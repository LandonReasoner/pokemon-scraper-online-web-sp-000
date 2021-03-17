class Pokemon
  attr_accessor :id, :name, :type, :db, :hp 
  
  def initialize(id, name, type, hp, db)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
    @hp = hp
  end 
  
  def self.save(name, type, hp, db)
    sql = <<-SQL
    INSERT INTO pokemon(name, tpye) VALUES (?,?);
    SQL
    
    DB[:conn].execute(sql, [name, type])
  end 
  
  
  
end
