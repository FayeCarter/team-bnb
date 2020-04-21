class Space

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.all
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT * FROM spaces;')
    result.map {|space| Space.new(space['name'])} 
  end
  
end