require 'space'
require 'pg'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      cottage = Space.create(name: "Cottage", price: 0, description: 'A wonderful property')
      connection = PG.connect(dbname: 'bnb_test')
      result = connection.query("SELECT * FROM spaces")
       
      expect(cottage.id).to eq(result[0]['id'])
      expect(cottage.name).to eq(result[0]['name'])
      expect(cottage.price).to eq(result[0]['price'])
      expect(cottage.description).to eq(result[0]['description'])
    end
  end

  describe '.all' do
    it 'gets the space' do
      Space.create(name:'London Flat', price: 0, description: '')
      space = Space.all
      expect(space[0].name).to eq('London Flat')
    end
  end
end
