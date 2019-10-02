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
  
  def save 
    sql = "INSERT INTO dogs (name, breed) VALUES (?, ?)"
    DB[:conn].execute(sql, name, breed)
  end
end