feature 'landlord can provide a price for their space' do
  scenario 'view the price after adding the space' do
    visit '/spaces/new'
    fill_in('name', with: 'Cottage')
    fill_in('price', with: '999')
    click_on 'Submit'
    expect(page).to have_content '£999'
  end
end