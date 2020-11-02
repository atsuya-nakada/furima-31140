class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handleng_time
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :category
    validates :condition
    validates :handleng_time
    validates :postage_payer
    validates :prefecture
    number = /\A[0-9]+\z/
    validates :price, numericality: { with: number }
  end
  validates :category_id, :condition_id, :handleng_time_id, :postage_payer_id, :prefecture_id, numericality: { other_than: 1 }
end
