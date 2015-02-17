# https://github.com/NoamB/sorcery/wiki/Testing-Rails#functional-tests
RSpec.configure do |c|
  c.include Sorcery::TestHelpers::Rails::Controller, type: :controller
  c.include Sorcery::TestHelpers::Rails::Integration, type: :feature
end
