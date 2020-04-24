require 'dbconnection'

describe DBConnection do
  describe '.connect' do
    it 'connects to the database' do
      expect { DBConnection.connect }.not_to raise_error()
    end

    it 'errors when the connection fails' do
      expect { DBConnection.connect(dbname: 'test', test_dbname: 'test') }.to raise_error PG::ConnectionBad
    end
  end

  describe '.query' do
    it 'can execute a valid query' do
      expect { DBConnection.query('SELECT * FROM spaces;') }.not_to raise_error()
    end

    it 'raises an error when given a bad query' do
      expect { DBConnection.query('SELECT POTATOES FROM farm;') }.to raise_error PG::Error
    end
  end
end
