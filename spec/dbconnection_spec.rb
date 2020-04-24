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
end