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

  scenario 'viewing the dates after adding the space' do
    visit '/spaces/new'
    fill_in('name', with: 'Cottage')
    fill_in('price', with: '999')
    fill_in('start-date0', with: '2020-04-23')
    fill_in('end-date0', with: '2020-04-24')
    click_on 'New date range'
    fill_in('start-date1', with: '2020-05-03')
    fill_in('end-date1', with: '2020-05-20')
    click_on 'Submit'
    expect(page).to have_content '2020-04-23 - 2020-04-24'
    expect(page).to have_content '2020-05-03 - 2020-05-20'
  end
end