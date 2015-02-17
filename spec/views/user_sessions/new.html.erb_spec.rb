require 'rails_helper'

RSpec.describe 'user_sessions/new.html.erb', :type => :view do
  let(:user) { build(:user) }

  before :each do
    assign(:user, user)
    render
  end

  it 'displays user form' do
    expect(rendered).to have_form(user_sessions_path, :post) do
      with_text_field('email')
      with_password_field('password')
      with_submit('Login')
    end
  end
end
