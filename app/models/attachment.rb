# == Schema Information
#
# Table name: attachments
#
#  id          :integer          not null, primary key
#  product_id  :integer          not null
#  name        :string
#  views_count :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_attachments_on_product_id  (product_id)
#

class Attachment < ApplicationRecord
  belongs_to :product
  has_many :attachment_views, dependent: :destroy
  has_one_attached :file
end
