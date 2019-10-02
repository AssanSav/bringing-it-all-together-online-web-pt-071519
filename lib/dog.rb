class Dog 
  attr_accessor :id, :name, :breed
  
  def initialize(hash={})
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end
  
  def self.create_table 
    DB[:conn].execute("CREATE TABLE IF NOT EXISTS dogs (id INTEGER PRIMARY KEY, name TEXT, breed TEXT)")
  end
  
  def self.drop_table 
    DB[:conn].execute("DROP TABLE dogs")
  end
  
  def self.new_from_db(row)
    dog = Dog.new(id: row[0], name: row[1], breed: row[2])
  end
  
   def self.find_by_name(name)
        result = DB[:conn].execute("SELECT * FROM dogs WHERE name = ?", name).first
        Dog.new(id: result[0], name: result[1], breed: result[2])
    end

  
  def save 
    
  end
end