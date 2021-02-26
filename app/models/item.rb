class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :day_to_ship

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :delivery_fee_id
      validates :shipping_area_id
      validates :day_to_ship_id
    end
    validates  :item_price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999} 
  end
end

    