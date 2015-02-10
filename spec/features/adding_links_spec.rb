require 'rails_helper'

feature 'Adding links', :type => :feature do

  scenario 'User enters a new link' do
    visit '/links/new'
    fill_in 'Url', with: 'https://www.ruby-lang.org/en/about/'
    click_button 'Submit'

    expect(page.find('.notice')).to have_text('Link was successfully created')
  end

  scenario 'User hits submit without adding a link' do
    visit '/links/new'
    click_button 'Submit'

    expect(page.find('.error')).to have_text('Something went wrong, please try again')
  end
end
