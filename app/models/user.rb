class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validate :password_complexity

  def password_complexity
    if password.present? && !password.match(/^(?=.*[!@#\$%\^&*])[A-Za-z\d!@#\$%\^&*]{8,20}$/)
      errors.add :password, "must contain at least one special character and be between 8 and 10 characters in length."
    end
  end
end
