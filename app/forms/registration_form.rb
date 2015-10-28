class RegistrationForm < Reform::Form
  property :email
  property :password
  property :password_confirmation, virtual: true

  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    presence: true
  validate :passwords_valid

  private

  def passwords_valid
    errors.add(:password, "can't be blank")              if password.blank?
    errors.add(:password_confirmation, "can't be blank") if password_confirmation.blank?
    errors.add(:password, "Passwords don't match")       unless password == password_confirmation
  end
end
