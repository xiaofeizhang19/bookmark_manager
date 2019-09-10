require './spec/spec_helper'

feature 'viewing bookmarks' do
  scenario 'displays bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end

feature 'adding bookmarks' do
  scenario 'add a new bookmark' do
    visit '/'
    click_button 'Add New'
    fill_in 'website', with: 'http://www.bbc.co.uk'
    click_button 'Submit'
    click_button 'View Bookmarks'
    expect(page).to have_content 'http://www.bbc.co.uk'
  end
end
