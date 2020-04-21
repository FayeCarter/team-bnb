require 'pg'

class Space
  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.create(name:)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("INSERT INTO spaces (name) VALUES('#{name}') RETURNING id, name;")
    return Space.new(id: result[0]['id'], name: result[0]['name'])
  end

  def self.all
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT * FROM spaces;')
    result.map {|space| Space.new(id: space['id'], name: space['name'])} 
  end
end
