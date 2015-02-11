require 'rails_helper'

RSpec.describe Scraper do
  let(:url) { 'http://danielhollands.co.uk/' }

  before :each do
    VCR.insert_cassette 'danielhollands-dot-co-uk-index'
  end

  after :each do
    VCR.eject_cassette
  end

  it 'accepts a url attribute' do
    scraper = Scraper.new(url: url)
    expect(scraper.url).to eq url
  end

  it 'raises an exception is the url is missing' do
    expect { Scraper.new }.to raise_exception
  end

  it 'returns the page title' do
    scraper = Scraper.new url: url
    expect(scraper.title).to eq "My Name is Daniel - a Web developer's curriculum vitae (CV)"
  end

  it 'returns the page body' do
    scraper = Scraper.new url: url
    expect(scraper.body).to include 'I found that finding work, despite my self-taught skills, difficult due to a lack of qualifications, which prompted me to go to university.'
  end
end
