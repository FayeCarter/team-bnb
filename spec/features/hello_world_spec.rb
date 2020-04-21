xfeature 'Hello world' do
  scenario 'it sys hello world on homepage' do
    visit '/'
    expect(page).to have_content 'Hello World!'
  end
end
