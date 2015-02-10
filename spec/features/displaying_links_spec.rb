require 'rails_helper'

feature 'Displaying Saved Links' do

  scenario 'User selects a link from a list of saved links' do
    visit '/links/new'
    fill_in 'Url', with: 'http://freelancers.birmingham.io/about/'
    click_button 'Submit'
    click_link 'About'
    expect(page).to have_text('This project is open source and open to forking and pull requests on GitHub.')
  end

end
