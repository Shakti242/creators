# == Schema Information
#
# Table name: accounts
#
#  id                   :integer          not null, primary key
#  charges_enabled      :boolean
#  created_at           :datetime         not null
#  payouts_enabled      :boolean
#  stripe_id            :string
#  updated_at           :datetime         not null
#  user_id              :integer          not null
#  financial_account_id :string
#  external_account_id  :string
#
# Indexes
#
#  index_accounts_on_user_id  (user_id)
#

class Account < ApplicationRecord
  belongs_to :user
  has_one :store
end
