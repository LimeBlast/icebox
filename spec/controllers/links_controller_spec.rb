require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  describe 'GET new' do
    let(:link_class) { class_double(Link).as_stubbed_const }
    let(:link) { object_double(Link) }

    before(:each) do
      allow(link_class).to receive(:new).and_return(link)
    end

    it 'returns http success' do
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

    before(:each) do
      allow(link_class).to receive(:new).and_return(link_object)
    end

    it 'attempts to creates a new link' do
      expect(link_class).to receive(:new).with(link_params).and_return(link_object)
      post :create, link: link_params
    end

    context 'create successful' do
      it 'redirects to the index path' do
        post :create, link: link_params
        expect(response).to redirect_to(links_path)
      end
    end

    context 'create unsuccessful' do
      let(:link_object) { double(Link, save: false) }

      it 'renders the new template' do
        post :create, link: link_params
        expect(response).to render_template(:new)
      end
    end
  end

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

end
