require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe 'GET new' do
    let(:user_class) { class_double(User).as_stubbed_const }
    let(:user) { object_double(User) }

    it 'returns http success' do
      allow(user_class).to receive(:new).and_return(user)
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'assigns a user model' do
      expect(user_class).to receive(:new).and_return(user)
      get :new
    end
  end
end
