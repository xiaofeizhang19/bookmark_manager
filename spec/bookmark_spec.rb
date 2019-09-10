require 'bookmark'


describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')

      bookmark = Bookmark.add_new(url: "http://www.makersacademy.com", title: "Makers Academy")
      Bookmark.add_new(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
      Bookmark.add_new(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
end
