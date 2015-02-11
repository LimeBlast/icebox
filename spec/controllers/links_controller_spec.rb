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
    before(:each) do
      @link       = object_double(Link.new, url: 'http://something.com')
      @link_class = class_double(Link).as_stubbed_const
      @pismo_dub  = class_double(Pismo::Document).as_stubbed_const
    end

    it 'fetches the requested link' do
      expect(@link_class).to receive(:find).with('1').and_return(@link)
      allow(@pismo_dub).to receive_message_chain(:new, :body)
      get :show, id: 1
    end

    it 'renders the show template' do
      allow(@link_class).to receive(:find).and_return(@link)
      allow(@pismo_dub).to receive_message_chain(:new, :body)
      get :show, id: 1
      expect(response).to render_template(:show)
    end

    it "fetches a url's content from pismo" do
      allow(@link_class).to receive(:find).and_return(@link)
      expect(@pismo_dub).to receive_message_chain(:new, :body)
      get :show, id: 1
    end
  end

  describe 'GET new' do
    let(:link_class) { class_double(Link).as_stubbed_const }
    let(:link) { object_double(Link) }

    it 'returns http success' do
      allow(link_class).to receive(:new).and_return(link)
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a link model' do
      expect(link_class).to receive(:new).and_return(link)
      get :new
    end
  end

  describe 'POST create' do
    let(:link_params) { { url: 'https://test.org' } }
    let(:link_class) { class_double(Link).as_stubbed_const }
    let(:link_object) { double(Link, save: true) }

    it 'scrapes the url submitted' do

    end

    it 'attempts to creates a new link' do
      expect(link_class).to receive(:new).with(link_params).and_return(link_object)
      post :create, link: link_params
    end

    context 'create successful' do
      it 'redirects to the index path' do
        allow(link_class).to receive(:new).and_return(link_object)
        post :create, link: link_params
        expect(response).to redirect_to(links_path)
      end
    end

    context 'create unsuccessful' do
      let(:link_object) { double(Link, save: false) }

      it 'renders the new template' do
        allow(link_class).to receive(:new).and_return(link_object)
        post :create, link: link_params
        expect(response).to render_template(:new)
      end
    end
  end

end
