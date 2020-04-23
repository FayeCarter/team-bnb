# frozen_string_literal: true

require 'user'
require 'bcrypt'

describe User do
  it '.create stores a user in the db and returns a user instance of the created user' do
    test_user = User.create(first_name: 'Graham', last_name: 'Falconer', email: 'gman@gmail.com', password: 'password123')
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec('SELECT password_digest FROM users;')

    expect(test_user.first_name).to eq 'Graham'
    expect(test_user.last_name).to eq 'Falconer'
    expect(test_user.email).to eq 'gman@gmail.com'
    expect(test_user.password).to eq result[0]['password_digest']
  end

  describe '.find_by_id' do
    it 'searches users database by id' do
      test_user = User.create(first_name: 'Graham', last_name: 'Falconer', email: 'gman@gmail.com', password: 'password123')
      found_user = User.find_by_id(test_user.id)

      expect(found_user.id).to eq(test_user.id)
      expect(found_user.first_name).to eq(test_user.first_name)
      expect(found_user.email).to eq(test_user.email)
    end
  end


  describe '.find_by_email' do
    it 'searches users database by email' do
      test_user = User.create(first_name: 'Graham', last_name: 'Falconer', email: 'gman@gmail.com', password: 'password123')
      found_user = User.find_by_email(test_user.email)

      expect(found_user.id).to eq(test_user.id)
      expect(found_user.first_name).to eq(test_user.first_name)
      expect(found_user.email).to eq(test_user.email)
    end
  end
end
