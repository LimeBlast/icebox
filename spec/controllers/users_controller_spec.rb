require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET new' do
    let(:register_user_class) { class_double(RegisterUser).as_stubbed_const }
    let(:register_user_object) { object_double(RegisterUser) }

    before :each do
      allow(register_user_class).to receive(:new).and_return(register_user_object)
      get :new
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end

    it 'assigns RegisterUser to @register_user' do
      expect(assigns(:register_user)).to eq(register_user_object)
    end
  end

  describe 'POST create' do
    let(:email) { 'email@example.com' }
    let(:password) { 'password' }

    let(:register_user_params) { { email: email, password: password, password_confirmation: password } }
    let(:register_user_class) { class_double('RegisterUser').as_stubbed_const }
    let(:register_user_object) { double('RegisterUser') }
    let(:user_object) { build(:user) }

    before :each do
      allow(register_user_object).to receive(:valid?).and_return(true)
      allow(register_user_class).to receive(:run).and_return(register_user_object)
      allow(register_user_object).to receive(:result).and_return(user_object)
    end

    it 'attempts to creates a new user' do
      post :create, register_user: register_user_params
      expect(assigns(:register_user)).to eq(register_user_object)
    end

    it 'redirects to the dashboard path if successful' do
      post :create, register_user: register_user_params
      expect(response).to redirect_to(dashboard_path)
    end

    it 'renders the new template if unsuccessful' do
      allow(register_user_object).to receive(:valid?).and_return(false)
      post :create, register_user: register_user_params
      expect(response).to render_template(:new)
    end
  end
end
