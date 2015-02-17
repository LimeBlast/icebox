require 'rails_helper'

RSpec.describe UserSessionsController, :type => :controller do

  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    let(:email) { 'email@example.com' }
    let(:password) { 'password' }

    let(:login_params) { { email: email, password: password } }

    it 'attempts to login a user' do
      expect(controller).to receive(:login).with(email, password).and_return(true)
      post :create, login_params
    end

    it 'redirects to the dashboard path if successful' do
      allow(controller).to receive(:login).with(email, password).and_return(true)
      post :create, login_params
      expect(response).to redirect_to dashboard_path
    end

    it 'renders the new template if unsuccessful' do
      allow(controller).to receive(:login).with(email, password).and_return(false)
      post :create, login_params
      expect(response).to render_template(:new)
    end
  end

  describe 'POST destroy' do
    it 'logs out a user' do
      expect(controller).to receive(:logout)
      post :destroy
    end

    it 'redirects to the homepage' do
      allow(controller).to receive(:logout)
      post :destroy
      expect(response).to redirect_to root_path
    end
  end
end
