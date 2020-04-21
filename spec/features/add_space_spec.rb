feature 'add a space' do
  scenario 'visit the new space page, enter name: "Cottage", then see Cottage has been listed' do
    visit '/spaces/new'
    fill_in('name', with: 'Cottage')
    click_on 'Submit'
    expect(page).to have_content 'Cottage has been listed'
  end
end
