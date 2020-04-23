require 'pg'

class Space
  attr_reader :id, :name, :description

  def initialize(id:, name:, description:)
    @id = id
    @name = name
    @description = description
  end

  def self.create(name:, description:)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("INSERT INTO spaces (name, description) VALUES('#{name}', '#{description}') RETURNING id, name, description;")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'])
  end

  def self.all
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT * FROM spaces;')
    result.map { |space| Space.new(id: space['id'], name: space['name'], description: space['description']) }
  end
end
