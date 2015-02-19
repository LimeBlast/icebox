class RegisterUser < ActiveInteraction::Base
  string :email, :password, :password_confirmation

  validates :url, :title, :body, presence: true
end
