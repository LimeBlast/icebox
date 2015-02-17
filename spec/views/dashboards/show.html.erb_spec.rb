require 'rails_helper'

RSpec.describe 'dashboards/show.html.erb', :type => :view do
  it 'shows "dashboard"' do
    render
    expect(rendered).to have_css('h1', 'Dashboard')
  end
end
