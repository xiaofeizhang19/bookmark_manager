require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = connect
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map do |bookmark|
      Bookmark.new(
        id: bookmark['id'],
        title: bookmark['title'],
        url: bookmark['url']
      )
    end
  end

  def self.add_new(url:, title:)
    connection = connect
    result = connection.exec <<-EOF
      INSERT INTO bookmarks (url, title)
      VALUES('#{url}', '#{title}')
      RETURNING id, url, title;
    EOF
  end

  private_class_method

  def self.connect
    return PG.connect(dbname: 'bookmark_manager_test') if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'bookmark_manager')
  end
end
