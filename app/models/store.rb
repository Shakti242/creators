# == Schema Information
#
# Table name: stores
#
#  id              :integer          not null, primary key
#  subdomain       :string
#  primary_color   :string
#  secondary_color :string
#  user_id         :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  account_id      :integer
#  name            :string
#  domain          :string
#
# Indexes
#
#  index_stores_on_account_id  (account_id)
#  index_stores_on_user_id     (user_id)
#

class Store < ApplicationRecord
  belongs_to :user
  has_many :products, through: :user
  has_many :customers, through: :products
  belongs_to :account, optional: true  # Optional if not every store has an account

  def self.find_by_request(request)
    where(subdomain: request.subdomain).first
  end
end
