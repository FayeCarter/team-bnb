require 'space'
feature 'User can view spaces' do
  
  scenario 'a space is shown on the page' do
    Space.create(name: 'London Flat', price: 0)
    visit('/spaces')
    expect(page).to have_content('London Flat')
  end
end