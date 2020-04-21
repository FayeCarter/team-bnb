require 'space'
require 'pg';

describe Space do
  describe '.create' do
    it 'creates a new space' do
      cottage = Space.create(name: "Cottage")
      connection = PG.connect(dbname: 'bnb_test')
      result = connection.query("SELECT * FROM spaces");
      
      expect(cottage.id).to eq(result[0]['id']);
      expect(cottage.name).to eq(result[0]['name']);
    end
  end

  describe '.all' do
    it 'gets the space' do
      connection = PG.connect(dbname: 'bnb_test')
      connection.exec("INSERT INTO spaces(name) VALUES('London Flat');")
      space = Space.all
      expect(space[0].name).to eq("London Flat")
    end
  end
end 
