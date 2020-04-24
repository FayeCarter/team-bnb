feature 'landlord can provide dates that the space is available' do
  scenario 'viewing the dates after adding the space' do
    visit '/spaces/new'
    fill_in('name', with: 'Cottage')
    fill_in('price', with: '999')
    fill_in('start-date', with: '2020-04-23')
    fill_in('end-date', with: '2020-04-24')
    click_on 'Submit'
    expect(page).to have_content '2020-04-23'
    expect(page).to have_content '2020-04-24'
  end
end