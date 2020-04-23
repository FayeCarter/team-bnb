require 'pg'

class Space
  attr_reader :id, :name, :price

  def initialize(id:, name:, price:)
    @id = id
    @name = name
    @price = price
  end

  def self.create(name:, price:)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("INSERT INTO spaces (name, price) VALUES('#{name}', '#{price}') RETURNING  id, name, price;")
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      price: result[0]['price']
    )
  end

  def self.all
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT * FROM spaces;')
    result.map do |space|
      Space.new(
        id: space['id'],
        name: space['name'],
        price: space['price']
      )
    end
  end
end
