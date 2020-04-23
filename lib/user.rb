# frozen_string_literal: true

require 'bcrypt'

class User
  attr_reader :id, :first_name, :last_name, :email, :password

  def initialize(id:, first_name:, last_name:, email:, password:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end

  def self.create(first_name:, last_name:, email:, password:)
    hashed_password = BCrypt::Password.create(password)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("INSERT INTO users (firstname, lastname, email, passworddigest) VALUES('#{first_name}','#{last_name}','#{email}','#{hashed_password}') RETURNING id, firstname, lastname, email, passworddigest;")
    User.new(
      id: result[0]['id'],
      first_name: result[0]['firstname'],
      last_name: result[0]['lastname'],
      email: result[0]['email'],
      password: result[0]['passworddigest']
    )
  end

  def self.find_by_id(id)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("SELECT * FROM users WHERE id = #{id}")
    User.new(
      id: result[0]['id'],
      first_name: result[0]['firstname'],
      last_name: result[0]['lastname'],
      email: result[0]['email'],
      password: result[0]['passworddigest']
    )
  end
  
end

