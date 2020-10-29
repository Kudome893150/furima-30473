class Item < ApplicationRecord
  with_options presence: true do
    validates :comment
    validates :name
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true,
    greater_than: 299, less_than: 10_000_000 }
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
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery_date
end
