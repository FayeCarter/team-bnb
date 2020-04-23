# frozen_string_literal: true

feature 'Signup' do
  scenario 'Graham signs up and sees his name' do
    visit '/users/new'
    fill_in('first_name', with: 'Graham')
    fill_in('last_name', with: 'Person')
    fill_in('password', with: 'graham_example')
    fill_in('email', with: 'gman@gmail.com')
    click_on 'Signup'
    expect(current_path).to eq('/')
    expect(page).to have_content 'Graham'
  end
  scenario 'Faye signs up and sees her name' do
    visit '/users/new'
    fill_in('first_name', with: 'Faye')
    fill_in('last_name', with: 'Person')
    fill_in('password', with: 'secret')
    fill_in('email', with: 'Faye@example.com')
    click_on 'Signup'
    expect(current_path).to eq('/')
    expect(page).to have_content 'Faye'
  end
end
