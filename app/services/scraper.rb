require 'pismo'

class Scraper
  attr_accessor :url, :title, :body

  def scrape(url)
    @url   = url
    doc    = Pismo::Document.new(url)
    @title = doc.title
    @body  = doc.body
  end

  def url
    @url || raise(ArgumentError, '.scrape(url) must be called first')
  end

  def title
    @title || raise(ArgumentError, '.scrape(url) must be called first')
  end

  def body
    @body || raise(ArgumentError, '.scrape(url) must be called first')
  end
end
