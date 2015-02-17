require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do
  describe 'GET home' do
    it 'renders the home template' do
      get :home
      expect(response).to render_template(:home)
    end
  end
end
