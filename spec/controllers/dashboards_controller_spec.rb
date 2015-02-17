require 'rails_helper'

RSpec.describe DashboardsController, :type => :controller do
  describe 'GET show' do
    context 'not logged in' do
      it 'redirects to login page' do
        get :show
        expect(response).to redirect_to(login_path)
      end
    end

    context 'user logged in' do
      let(:user) { build(:user) }

      before :each do
        login_user(user)
      end

      it 'renders the show template' do
        get :show
        expect(response).to render_template(:show)
      end
    end
  end
end
