require 'rails_helper'

RSpec.describe 'Routes', :type => :routing do
  it 'uses GET / to show homepage' do
    expect(:get => '/')
      .to route_to(
          controller: 'static_pages',
          action: 'home'
        )
  end

  it 'uses GET /sigunp to sign up' do
    expect(:get => '/signup')
      .to route_to(
          controller: 'users',
          action: 'new'
        )
  end

  it 'uses GET /login to login' do
    expect(:get => '/login')
      .to route_to(
          controller: 'user_sessions',
          action: 'new'
        )
  end

  it 'uses POST /logout to log out' do
    expect(:post => '/logout')
      .to route_to(
          controller: 'user_sessions',
          action: 'destroy'
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
