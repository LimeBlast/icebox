require 'rails_helper'

RSpec.describe 'users/new.html.erb', :type => :view do
  let(:user) { build(:user) }

  before :each do
    assign(:user, user)
    render
  end

  it 'displays user form' do
    expect(rendered).to have_form(users_path, :post) do
      with_text_field('user[email]')
      with_text_field('user[password]')
      with_text_field('user[password_confirmation]')
      with_submit('Sign up')
    end
  end
end
