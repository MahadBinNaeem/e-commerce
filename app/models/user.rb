class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_roles
  has_many :roles, through: :user_roles

  PASSWORD_REGEX=/^(?=.*[!@#\$%\^&*])[A-Za-z\d!@#\$%\^&*]{8,20}$/
  validate :password_complexity

  def password_complexity
    if password.present? && !password.match(PASSWORD_REGEX)
      errors.add :password, "must contain at least one special character and be between 8 and 10 characters in length."
    end
  end

  def admin?
    roles.exists?(name: 'admin')
  end

end
