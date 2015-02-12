require 'rails_helper'

feature 'Displaying Saved Links' do

  before :each do
    VCR.insert_cassette 'danielhollands-dot-co-uk-index'
  end

  after :each do
    VCR.eject_cassette
  end

  scenario 'User selects a link from a list of saved links' do
    visit '/links/new'
    fill_in 'Url', with: 'http://danielhollands.co.uk/'
    click_button 'Submit'
    click_link "My Name is Daniel - a Web developer's curriculum vitae (CV)"
    expect(page).to have_text('I found that finding work, despite my self-taught skills, difficult due to a lack of qualifications, which prompted me to go to university.')
  end
end
