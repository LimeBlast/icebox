require 'rails_helper'

RSpec.describe DashboardsController, :type => :controller do
  describe 'GET show' do
    it 'renders the index template' do
      get :show
      expect(response).to render_template(:show)
    end
  end
end
