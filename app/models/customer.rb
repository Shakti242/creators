# == Schema Information
#
# Table name: customers
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  email            :string           not null
#  session_token    :string
#  store_id         :integer          not null
#  stripe_id        :string
#  token_expires_at :datetime
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_customers_on_store_id  (store_id)
#

class Customer < ApplicationRecord
  belongs_to :store
  has_many :customer_products
  has_many :products, through: :customer_products
  has_many :attachments, through: :products

  after_commit on: :create do
    reset_session_token!
  end

  def reset_session_token!
    update!(
      session_token: SecureRandom.urlsafe_base64,
      token_expires_at: 1.day.from_now
    )
  end
end
