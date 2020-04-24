require 'pg'

class DBConnection
  def self.connect( test_dbname: 'bnb_test', dbname: 'bnb')
    if ENV['environment'] == 'test'
      connection = PG.connect(dbname: test_dbname)
      p connection
    else
      connection = PG.connect(dbname: dbname)
      p connection
    end
  end
end