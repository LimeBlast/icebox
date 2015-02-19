require 'rails_helper'

RSpec.describe RegisterUserForm do
  let(:email) { 'email@example.com' }
  let(:password) { 'password' }
  let(:password_confirmation) { 'password' }
  let(:user) { build(:user) }
  let(:user_exists?) { false }

  let(:model_name) { ActiveModel::Name.new(self, nil, 'RegisterUser') }
  let(:valid_params) { { email: email, password: password, password_confirmation: password_confirmation } }
  let(:user_class) { class_double(User).as_stubbed_const }

  before :each do
    allow(user_class).to receive(:create!).and_return(user)
    allow(user_class).to receive(:exists?).and_return(user_exists?)
  end

  it 'accepts a valid hash' do
    expect { RegisterUserForm.run!(valid_params) }.to_not raise_error
  end

  it "doesn't accept an invalid hash" do
    expect { RegisterUserForm.run!({}) }.to raise_error(ActiveInteraction::InvalidInteractionError)
  end

  it 'returns RegisterUser as the model_name' do
    expect(RegisterUserForm.model_name).to eq(model_name)
  end

  context 'when passwords do not match' do
    let(:password) { 'password1' }
    let(:password_confirmation) { 'password2' }

    it 'is invalid' do
      result = RegisterUserForm.run(valid_params)
      expect(result.valid?).to eq(false)
    end
  end

  context 'when password is too short' do
    let(:password) { '12' }
    let(:password_confirmation) { '12' }

    it 'is invalid' do
      result = RegisterUserForm.run(valid_params)
      expect(result.valid?).to eq(false)
    end
  end

  context 'when password confirmation is missing' do
    let(:password_confirmation) { '' }

    it 'is invalid' do
      result = RegisterUserForm.run(valid_params)
      expect(result.valid?).to eq(false)
    end
  end

  context 'when email is missing' do
    let(:email) { '' }

    it 'is invalid' do
      result = RegisterUserForm.run(valid_params)
      expect(result.valid?).to eq(false)
    end
  end

  context 'when email is not unique' do
    let(:user_exists?) { true }

    it 'is invalid' do
      result = RegisterUserForm.run(valid_params)
      expect(result.valid?).to eq(false)
    end
  end
end
