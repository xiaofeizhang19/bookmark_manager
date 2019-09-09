require './spec/spec_helper'

feature 'testing page' do
  scenario 'page should dislpay hello world' do
    visit '/'
    expect(page).to have_content 'Hello World'
  end
end 
