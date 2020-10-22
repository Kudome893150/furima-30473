class Item < ApplicationRecord
  with_options presence: true do
    validates :comment
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  with_options presence: true, numericality: { greater_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :area_id
    validates :delivery_date_id
    validates :charge_id
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date
end
