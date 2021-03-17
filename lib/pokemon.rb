class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  def initialize(db)
    @id = id 
    @name = name 
    @type = type 
    @db = db 
  end 
  
  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon(name, type) VALUES (?,?);
    SQL
    
    db[:conn].execute(sql, [name, type])
  end 
  
  
  
end
