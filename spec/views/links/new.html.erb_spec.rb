require 'rails_helper'

RSpec.describe 'links/new.html.erb', :type => :view do
  let(:link) { build(:link) }

  before :each do
    assign(:link, link)
    render
  end

  it 'displays link form' do
    expect(rendered).to have_form(links_path, :post) do
      with_text_field('link[url]')
      with_submit('Submit')
    end
  end
end
