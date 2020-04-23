require 'space'
require 'pg'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      cottage = Space.create(name: "Cottage", price: 0, description: 'A wonderful property', start_date:'2020-04-23', end_date:'2020-04-24')
      connection = PG.connect(dbname: 'bnb_test')
      result = connection.query("SELECT * FROM spaces")
       
      expect(cottage.id).to eq(result[0]['id'])
      expect(cottage.name).to eq(result[0]['name'])
      expect(cottage.price).to eq(result[0]['price'])
      expect(cottage.description).to eq(result[0]['description'])
      expect(cottage.start_date).to eq(result[0]['start_date'])
      expect(cottage.end_date).to eq(result[0]['end_date'])
    end
  end

  describe '.all' do
    it 'gets the space' do
      Space.create(name:'London Flat', price: 0, description: '', start_date: '2020-04-23', end_date: '2020-04-23')
      space = Space.all
      expect(space[0].name).to eq('London Flat')
    end
  end
end
