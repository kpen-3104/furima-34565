class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'is invalid. Input full-width characters.' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶ一-]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
      validates :first_name_reading
      validates :last_name_reading
    end  
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end
