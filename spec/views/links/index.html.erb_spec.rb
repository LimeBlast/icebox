require 'rails_helper'

RSpec.describe 'links/index.html.erb', :type => :view do
  let(:links) { build_list(:link, 3, id: 1) }

  before :each do
    assign(:links, links)
    render
  end

  it 'shows the page title' do
    expect(rendered).to have_css('h1', 'Links')
  end

  it 'displays a list of links' do
    expect(rendered).to have_link(links[0].title, :href => link_path(links[0]))
    expect(rendered).to have_link(links[1].title, :href => link_path(links[1]))
    expect(rendered).to have_link(links[2].title, :href => link_path(links[2]))
  end
end
