feature 'test page' do
  scenario 'visit the index page' do
    visit '/'
    expect(page).to have_content('Hello World')
  end
end