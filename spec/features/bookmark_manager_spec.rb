require 'pg'

feature 'viewing bookmarks' do
  scenario 'displays bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    Bookmark.add_new(
      url: 'http://www.makersacademy.com',
      title: 'Makers Academy'
    )
    Bookmark.add_new(
      url: 'http://www.google.com',
      title: 'Google'
    )
    Bookmark.add_new(
      url: 'http://www.destroyallsoftware.com',
      title: 'Destroy All Software'
    )
  
    visit '/bookmarks'
    expect(page).to have_link(
      'Makers Academy',
      href: 'http://www.makersacademy.com'
    )
    expect(page).to have_link(
      'Destroy All Software',
      href: 'http://www.destroyallsoftware.com'
    )
    expect(page).to have_link(
      'Google',
      href: 'http://www.google.com'
    )
  end
end

feature 'adding bookmarks' do
  scenario 'add a new bookmark' do
    visit '/'
    click_button 'Add New'
    fill_in 'url', with: 'http://www.bbc.co.uk'
    fill_in 'title', with: 'BBC'
    click_button 'Submit'
    click_button 'View Bookmarks'
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end
end
