require 'email_validator'

class RegisterUserForm < ActiveInteraction::Base
  string :email, :password, :password_confirmation

  validates :email, presence: true, email: true
  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validate :email_uniqueness

  def execute
    User.create!(inputs)
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, 'RegisterUser')
  end

  private

  def email_uniqueness
    errors.add_sym(:email, :not_unique) unless email_unique?
  end

  def email_unique?
    !User.exists?(email: email)
  end
end
