require 'rails_helper'

RSpec.describe 'Routes', :type => :routing do
  it 'uses GET /sigunp to sign up' do
    expect(:get => '/signup')
      .to route_to(
          controller: 'users',
          action: 'new'
        )
  end
end
