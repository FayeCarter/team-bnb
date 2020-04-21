class Space

  attr_reader :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.all
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT * FROM spaces;')
    result.map {|space| Space.new(id: space['id'], name: space['name'])} 
  end
  
end