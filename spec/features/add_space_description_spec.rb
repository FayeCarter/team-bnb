feature 'Landlord can provide a description for their space' do
  scenario 'view the description after adding the space' do
    visit '/spaces/new'

    fill_in('name', with: 'Lighthouse')
    fill_in('description', with: 'A lovely property with wonderful views')
    click_on 'Submit'

    expect(page).to have_content 'A lovely property with wonderful views'
  end
end