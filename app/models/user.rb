class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
    validates :password, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6 }
    validates :password_confirmation, format: { with: VALID_PASSWORD_REGEX }, length: { minimum: 6 }
    kanji = /\A[一-龥]+\z/
    validates :last_name, format: { with: kanji }
    validates :first_name, format: { with: kanji } 
    kana = /\A[ァ-ヶー－]+\z/
    validates :last_name_kana, format: {with: kana}
    validates :first_name_kana, format: {with: kana}
    validates :birth_date
  end
end
