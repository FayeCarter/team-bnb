require 'space'

describe Space do 
  it " should take a name when a new space is made" do
    space = Space.new("London Flat")
    expect(space.name).to eq("London Flat")
  end

  it 'gets the space' do
    connection = PG.connect(dbname: 'bnb_test')
    connection.exec("INSERT INTO spaces(name) VALUES('London Flat');")
    space = Space.all
    expect(space[0].name).to eq("London Flat")
  end
end 