class User
  attr_reader :first_name, :last_name, :email, :password

  def intialize(first_name:, last_name:, email:, password:)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @password = password
  end


  def self.create(first_name:, last_name:, email:, password:)
    connection = PG.connect(dbname: 'bnb_test')
    result = connection.exec("INSERT INTO users (firstname, lastname, email, passworddigest) VALUES('#{first_name}','#{last_name}','#{email}','#{password}') RETURNING firstname, lastname, email, passworddigest;")
    return User.new(first_name: result[0]['firstname'], last_name: result[0]['lastname'], email: result[0]['email'], password: result[0]['passworddigest'])
  end

  # users (id SERIAL PRIMARY KEY, firstname VARCHAR(60) NOT NULL, lastname VARCHAR(60) NOT NULL, email VARCHAR(60) NOT NULL UNIQUE, passworddigest VARCHAR(60) NOT NULL);
end
  #test_user = User.create(first_name: 'Graham', last_name: 'Falconer', email: 'gman@gmail.com', password: 'password123')
