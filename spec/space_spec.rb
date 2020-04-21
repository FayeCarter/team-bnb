require 'space'

describe Space do
  describe '.all' do
    it 'gets the space' do
      connection = PG.connect(dbname: 'bnb_test')
      connection.exec("INSERT INTO spaces(name) VALUES('London Flat');")
      space = Space.all
      expect(space[0].name).to eq("London Flat")
    end
  end
end 