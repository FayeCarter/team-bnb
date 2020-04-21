require 'PG'

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
end
