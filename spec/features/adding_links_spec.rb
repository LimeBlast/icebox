require 'rails_helper'

feature 'Adding links', :type => :feature do

  before :each do
    VCR.insert_cassette 'danielhollands-dot-co-uk-index'
  end

  after :each do
    VCR.eject_cassette
  end

  scenario 'User enters a new link' do
    visit '/links/new'
    fill_in 'Url', with: 'http://danielhollands.co.uk/'
    click_button 'Submit'

    expect(page.find('.notice')).to have_text('Link was successfully created')
  end

  scenario 'User hits submit without adding a link' do
    visit '/links/new'
    click_button 'Submit'

    expect(page.find('.error')).to have_text('Something went wrong, please try again')
  end
end
