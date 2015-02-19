class RegisterUser < ActiveInteraction::Base
  string :email, :password, :password_confirmation

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validate :email_uniqueness

  def execute
    User.create!(inputs)
  end

  private

    def email_uniqueness
      errors.add_sym(:email, :not_unique) unless email_unique?
    end

    def email_unique?
      !User.exists?(email: email)
    end
end
