# == Schema Information
#
# Table name: customer_products
#
#  id                  :integer          not null, primary key
#  customer_id         :integer          not null
#  product_id          :integer          not null
#  checkout_session_id :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  idx_on_customer_id_product_id_checkout_session_id_28f7393e38  (customer_id,product_id,checkout_session_id) UNIQUE
#  index_customer_products_on_customer_id                        (customer_id)
#  index_customer_products_on_product_id                         (product_id)
#

class CustomerProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product
end
