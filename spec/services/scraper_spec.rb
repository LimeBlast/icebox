require 'rails_helper'

RSpec.describe Scraper do
  before :each do
    VCR.insert_cassette 'danielhollands-dot-co-uk-index'
  end

  after :each do
    VCR.eject_cassette
  end

  it 'accepts a url' do
    scraper = Scraper.new
    scraper.scrape 'http://danielhollands.co.uk/'
    expect(scraper.url).to eq 'http://danielhollands.co.uk/'
  end

  it 'returns the page title' do
    scraper = Scraper.new
    scraper.scrape 'http://danielhollands.co.uk/'
    expect(scraper.title).to eq "My Name is Daniel - a Web developer's curriculum vitae (CV)"
  end

  it 'returns the page body' do
    scraper = Scraper.new
    scraper.scrape 'http://danielhollands.co.uk/'
    expect(scraper.body).to include 'I found that finding work, despite my self-taught skills, difficult due to a lack of qualifications, which prompted me to go to university.'
  end

  context "if the scrape method doesn't have a URL passed" do
    specify 'raise an exceptions when scrape is called' do
      scraper = Scraper.new
      expect { scraper.scrape }.to raise_exception
    end

    specify 'raise an exceptions when url is called' do
      scraper = Scraper.new
      expect { scraper.url }.to raise_exception
    end

    specify 'raise an exceptions when title is called' do
      scraper = Scraper.new
      expect { scraper.title }.to raise_exception
    end

    specify 'raise an exceptions when body is called' do
      scraper = Scraper.new
      expect { scraper.body }.to raise_exception
    end
  end
end
