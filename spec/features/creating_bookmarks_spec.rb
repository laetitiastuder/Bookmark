feature 'Adding a new bookmark' do
  scenario 'the user can add bookmarks' do
    visit ('/bookmarks/new')
    fill_in('url', with: 'http://github.com')
    click_button('Submit')

    expect(page).to have_content 'http://github.com'
  end
end