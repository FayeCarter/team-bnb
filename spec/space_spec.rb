require 'space'
require 'PG';

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
end