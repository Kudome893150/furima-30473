class Item < ApplicationRecord
  with_options presence: true do
    validates :comment
    validates :category_id, numericality: { greater_than: 1 }
    validates :condition_id, numericality: { greater_than: 1 }
    validates :name
    validates :charge_id, numericality: { greater_than: 1 }
    validates :area_id, numericality: { greater_than: 1 }
    validates :delivery_date_id, numericality: { greater_than: 1 }
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
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
