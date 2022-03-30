require 'bookmark'

RSpec.describe Bookmark do
  describe '.all_bookmarks' do
    it 'return all bookmarks in a list' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com/');")

      bookmarks = Bookmark.all_bookmarks
      expect(bookmarks).to include("http://www.google.com/")
      expect(bookmarks).to include("http://www.destroyallsoftware.com")
      expect(bookmarks).to include("http://www.makersacademy.com/")
    end
  end

  describe '.create' do
    it 'create a new bookmark' do
      Bookmark.create(url:'http://www.github.com')

      expect(Bookmark.all_bookmarks).to include 'http://www.github.com'
    end
  end


end