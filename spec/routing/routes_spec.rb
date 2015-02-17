require 'rails_helper'

RSpec.describe 'Routes', :type => :routing do
  it 'uses GET /sigunp to sign up' do
    expect(:get => '/signup')
      .to route_to(
          controller: 'users',
          action: 'new'
        )
  end

  it 'uses GET /dashboard for the dashboard' do
    expect(:get => '/dashboard')
      .to route_to(
          controller: 'dashboards',
          action: 'show'
        )
  end
end
