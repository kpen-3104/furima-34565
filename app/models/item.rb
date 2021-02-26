class Item < ApplicationRecord
  belongs_to :user
  has_one_attend :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :shipping_area
  belongs_to :day_to_ship
end
