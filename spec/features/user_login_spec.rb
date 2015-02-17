require 'rails_helper'

feature 'User Login' do
  let(:user) {create(:user, password: 'password')}

  scenario 'A user can log into an account' do
    visit '/login'
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'Login'
    expect(page).to have_content('Welcome! You have logged in successfully.')
    expect(page).to have_content('Dashboard')
  end
end
