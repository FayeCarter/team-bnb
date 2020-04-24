feature 'authentication' do
  scenario 'existing user signs in and sees their name' do
    existing_user = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@smith.com', password: 'johniscool')
    visit('sessions/new')
    fill_in('password', with: 'johniscool')
    fill_in('email', with: 'johnsmith@smith.com')
    click_on 'login'
    expect(page).to have_content('john')
    expect(page).to_not have_content('Sinatra')
  end


end
