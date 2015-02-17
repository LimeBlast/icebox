require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET new' do
    let(:user_class) { class_double(User).as_stubbed_const }
    let(:user) { object_double(User) }

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a user model' do
      expect(user_class).to receive(:new).and_return(user)
      get :new
    end
  end

  describe 'POST create' do
    let(:email) { 'email@example.com' }
    let(:password) { 'password' }

    let(:user_params) { { email: email, password: password, password_confirmation: password } }
    let(:user_class) { class_double('User').as_stubbed_const }
    let(:user_object) { double('User') }

    before :each do
      allow(user_object).to receive(:save).and_return(true)
    end

    it 'attempts to creates a new user' do
      expect(user_class).to receive(:new).with(user_params).and_return(user_object)
      post :create, user: user_params
    end

    it 'redirects to the dashboard path if successful' do
      allow(user_class).to receive(:new).and_return(user_object)
      post :create, user: user_params
      expect(response).to redirect_to(dashboard_path)
    end

    it 'renders the new template if unsuccessful' do
      allow(user_object).to receive(:save).and_return(false)
      allow(user_class).to receive(:new).and_return(user_object)
      post :create, user: user_params
      expect(response).to render_template(:new)
    end
  end
end
