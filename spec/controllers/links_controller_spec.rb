require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  describe 'GET index' do
    let(:link_class) { class_double(Link).as_stubbed_const }

    it 'renders the index template' do
      allow(link_class).to receive(:all)
      get :index
      expect(response).to render_template(:index)
    end

    it 'sends the all method to Link' do
      expect(link_class).to receive(:all)
      get :index
    end
  end

  describe 'GET show' do
    let(:link_id) { 1.to_s }
    let(:link_class) { class_double(Link).as_stubbed_const }
    let(:link) { object_double(Link) }

    it 'assigns a link model' do
      expect(link_class).to receive(:find).with(link_id).and_return(link)
      get :show, id: link_id
    end
  end

  describe 'GET new' do
    let(:link_class) { class_double(Link).as_stubbed_const }
    let(:link) { object_double(Link) }

    it 'renders the new template' do
      allow(link_class).to receive(:new).and_return(link)
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a link model' do
      expect(link_class).to receive(:new).and_return(link)
      get :new
    end
  end

  describe 'POST create' do
    let(:url) { 'http://test.org/' }

    let(:link_params) { { url: url } }
    let(:link_class) { class_double('Link').as_stubbed_const }
    let(:link_object) { double('Link') }

    let(:scraper_class) { class_double('Scraper').as_stubbed_const }
    let(:doc_object) { double('Scraper', url: url, title: 'test title', body: 'test body') }

    before :each do
      allow(link_object).to receive(:title=)
      allow(link_object).to receive(:body=)
      allow(link_object).to receive(:url).and_return(url)
      allow(link_object).to receive(:save).and_return(true)
      allow(scraper_class).to receive(:new).with(url: url).and_return(doc_object)
    end

    # it 'scrapes the submitted url' do
    #   expect(scraper_class).to receive(:new).with(url: url).and_return(doc_object)
    # end

    it 'attempts to creates a new link' do
      expect(link_class).to receive(:new).with(link_params).and_return(link_object)
      post :create, link: link_params
    end

    it 'redirects to the index path if successful' do
      allow(link_class).to receive(:new).and_return(link_object)
      post :create, link: link_params
      expect(response).to redirect_to(links_path)
    end

    it 'renders the new template if unsuccessful' do
      allow(link_object).to receive(:save).and_return(false)
      allow(link_class).to receive(:new).and_return(link_object)
      post :create, link: link_params
      expect(response).to render_template(:new)
    end
  end
end
