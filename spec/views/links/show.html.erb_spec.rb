require 'rails_helper'

RSpec.describe 'links/show.html.erb', :type => :view do
  let(:link) { build(:link) }

  before :each do
    assign(:link, link)
    render
  end

  it 'shows the page title' do
    expect(rendered).to have_css('h1', link.title)
  end

  it "displays the link's body" do
    expect(rendered).to have_css('div.body', link.body)
  end
end
