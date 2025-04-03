# == Schema Information
#
# Table name: products
#
#  id              :integer          not null, primary key
#  stripe_id       :string
#  stripe_price_id :string
#  data            :json
#  name            :string           not null
#  description     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer          not null
#  photo           :string
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#

class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
  has_one :store, through: :user
  has_many :customer_products
  has_many :customers, through: :customer_products
  has_many :attachments, dependent: :destroy

  has_one_attached :photo do |photo|
    photo.variant :thumb, resize_to_limit: [100, 100]
    photo.variant :medium, resize_to_limit: [400, 400]
  end

  def price
    product_data&.default_price&.unit_amount&.fdiv(100.0)
  end

  def product_data
    return if data.blank?
    Stripe::Product.construct_from(JSON.parse(data))
  end
end
