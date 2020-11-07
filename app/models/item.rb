class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
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
    number = /\A[0-9]+\z/
    validates :price, numericality: { with: number, :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999}
    validates :category_id, :condition_id, :handleng_time_id, :postage_payer_id, :prefecture_id, numericality: { other_than: 1 }
  end
end
