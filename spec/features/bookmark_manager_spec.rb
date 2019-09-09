require './spec/spec_helper'

feature 'testing page' do
  scenario 'page should dislpay hello world' do
    visit '/'
    expect(page).to have_content 'Bookmark Manager'
  end
end 

feature 'viewing bookmarks' do
  scenario 'displays bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content 'http://www.makersacademy.com'
    expect(page).to have_content 'http://www.destroyallsoftware.com'
    expect(page).to have_content 'http://www.google.com'
  end
end