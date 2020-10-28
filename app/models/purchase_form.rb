class PurchaseForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_num, :building_name, :phone_num, :token, :user_id, :item_id

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :house_num
    validates :phone_num, format: { with: /\d{11}/ }
  end
  validates :prefecture_id, numericality: { other_than: 0 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id,
                   city: city, house_num: house_num, building_name: building_name,
                   phone_num: phone_num, purchase_id: purchase.id)
  end
end
