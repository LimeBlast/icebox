require 'rails_helper'

RSpec.describe 'static_pages/home.html.erb', :type => :view do
  it 'shows "home"' do
    render
    expect(rendered).to have_css('h1', text: 'Home')
  end
end
