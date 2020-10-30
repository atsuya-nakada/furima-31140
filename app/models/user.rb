class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :encrypted_password,     presence: true, length: { minimum: 6 }
  kanji = /\A[一-龥]+\z/
  validates :last_name, presence: true, format: { with: kanji }
  validates :first_name, presence: true, format: { with: kanji }
  kana = /\A[ァ-ヶー－]+\z/
  validates :last_name_kana, presence: true, format: {with: kana}
  validates :first_name_kana, presence: true, format: {with: kana}
  validates :birth_date, presence: true
end
