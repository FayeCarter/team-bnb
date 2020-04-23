require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'bnb_test')
  # Clear the tables
  connection.exec("TRUNCATE spaces, users CASCADE;")
end
