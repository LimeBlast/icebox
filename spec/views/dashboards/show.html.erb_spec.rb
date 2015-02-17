require 'rails_helper'

RSpec.describe 'dashboards/show.html.erb', :type => :view do
  before :each do
    render
  end

  it 'shows "dashboard"' do
    expect(rendered).to have_css('h1', 'Dashboard')
  end
end
