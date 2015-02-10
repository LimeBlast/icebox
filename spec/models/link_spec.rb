require 'rails_helper'

RSpec.describe Link, :type => :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }
end
