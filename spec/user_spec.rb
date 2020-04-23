# frozen_string_literal: true

require 'user'
require 'bcrypt'

describe User do
  it '.create stores a user in the db and returns a user instance of the created user' do
    test_user = User.create(first_name: 'Graham', last_name: 'Falconer', email: 'gman@gmail.com', password: 'password123')
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("SELECT passworddigest FROM users;")

    expect(test_user.first_name).to eq "Graham"
    expect(test_user.last_name).to eq "Falconer"
    expect(test_user.email).to eq "gman@gmail.com"
    expect(test_user.password).to eq result[0]['passworddigest']
  end
end
