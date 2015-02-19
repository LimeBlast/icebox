require 'rails_helper'

RSpec.describe 'users/new.html.erb', :type => :view do
  let(:register_user) { RegisterUser.new }

  before :each do
    assign(:register_user, register_user)
    render
  end

  it 'displays user form' do
    expect(rendered).to have_form(users_path, :post) do
      with_text_field('register_user[email]')
      with_text_field('register_user[password]')
      with_text_field('register_user[password_confirmation]')
      with_submit('Sign up')
    end
  end
end
