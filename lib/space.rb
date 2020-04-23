require 'pg'

class Space
  attr_reader :id, :name, :price, :description

  def initialize(id:, name:, price:, description:)
    @id = id
    @name = name
    @price = price
    @description = description
  end

  def self.create(name:, price:, description:)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("INSERT INTO spaces (name, price, description) VALUES('#{name}', '#{price}, '#{description}') RETURNING  id, name, price, description;")
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      price: result[0]['price'],
      description: result[0]['description']
    )
  end

  def self.all
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(
        id: space['id'],
        name: space['name'],
        price: space['price'],
        description: space['description']
      )
    end
  end
end
