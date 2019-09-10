def truncate_table
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE TABLE bookmarks;")
end

def insert_bookmarks
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com')")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com')")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com')")
end
