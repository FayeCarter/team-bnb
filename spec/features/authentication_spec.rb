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

  scenario 'existing user signs in with wrong password and gets error message' do
    existing_user = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@smith.com', password: 'johniscool')
    visit('sessions/new')
    fill_in('password', with: 'wrongpassword')
    fill_in('email', with: 'johnsmith@smith.com')
    click_on 'login'
    expect(page).to have_content('Incorrect email or password')
    expect(page).to_not have_content('Sinatra')
  end

  scenario 'existing user signs in with wrong email and gets error message' do
    existing_user = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@smith.com', password: 'johniscool')
    visit('sessions/new')
    fill_in('password', with: 'johniscool')
    fill_in('email', with: 'wrongemail@smith.com')
    click_on 'login'
    expect(page).to have_content('Incorrect email or password')
    expect(page).to_not have_content('Sinatra')
  end

  scenario 'user signs out and gets sign  out message' do 
    existing_user = User.create(first_name: 'john', last_name: 'smith', email: 'johnsmith@smith.com', password: 'johniscool')
    visit('sessions/new')
    fill_in('password', with: 'johniscool')
    fill_in('email', with: 'johnsmith@smith.com')
    click_on 'login'
    expect(current_path).to eq '/'
    click_on 'logout'
    expect(page).to have_content("You have been signed out")
    expect(page).to_not have_content("john")
  end
end
