feature 'User can view spaces' do
  
  scenario 'a space is shown on the page' do
    connection = PG.connect(dbname: 'bnb_test')
    connection.exec("INSERT INTO spaces(name) VALUES('London Flat');")
    visit('/spaces')
    expect(page).to have_content('London Flat')
  end
end