require 'pg'

class Space
  attr_reader :id, :name, :price, :description, :start_date, :end_date

  def initialize(id:, name:, price:, description:, start_date: '', end_date: '')
    @id = id
    @name = name
    @price = price
    @description = description
    @start_date = start_date
    @end_date = end_date
  end

  def self.create(name:, price:, description:, start_date: 'default', end_date: 'default')
    connection = PG.connect(dbname: 'bnb_test')
    if start_date != 'default'
      result = connection.exec("INSERT INTO spaces (name, price, description, start_date, end_date) VALUES('#{name}', '#{price}', '#{description}', '#{start_date}', '#{end_date}') RETURNING  id, name, price, description, start_date, end_date;")
    else
      result = connection.exec("INSERT INTO spaces (name, price, description) VALUES('#{name}', '#{price}', '#{description}' ) RETURNING  id, name, price, description;")
    end
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      price: result[0]['price'],
      description: result[0]['description'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date']
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
        description: space['description'],
        start_date: space['start_date'],
        end_date: space['end_date']
      )
    end
  end
end
