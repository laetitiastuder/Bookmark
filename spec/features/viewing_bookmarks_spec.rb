feature 'Viewing bookmarks' do
  scenario 'the user can see its bookmarks' do
    
    # Prior refactoring - created dummy data # Add the test data
    #connection = PG.connect(dbname: 'bookmark_manager_test')
    # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com/');")
    # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com/');")
    Bookmark.create(url: "http://www.makersacademy.com/")
    Bookmark.create(url: "http://www.destroyallsoftware.com")
    Bookmark.create(url: "http://www.google.com/")
    visit('/bookmarks')

    expect(page). to have_content "http://www.google.com/"
    expect(page). to have_content "http://www.destroyallsoftware.com"
    expect(page). to have_content "http://www.makersacademy.com/"
  end
end