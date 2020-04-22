feature 'Signup' do
  scenario 'Graham signs up and sees his name' do
    visit '/users/new'
    fill_in('name', with: 'Graham')
    fill_in('password', with: 'graham_example')
    fill_in('email', with: 'gman@gmail.com')
    click_on 'Signup'
    # expect(current_path).to be('/spaces')
    expect(page).to have_content'Graham'
  end
end
