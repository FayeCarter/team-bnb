require 'pg'

class DBConnection
  attr_reader :connection
  def self.connect( test_dbname: 'bnb_test', dbname: 'bnb')
    if ENV['environment'] == 'test'
      @connection = PG.connect(dbname: test_dbname)
    else
      @connection = PG.connect(dbname: dbname)
    end
  end

  def self.query(sql)
      self.connect
      @connection.exec(sql)
  end
end

