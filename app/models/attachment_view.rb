# == Schema Information
#
# Table name: attachment_views
#
#  id            :integer          not null, primary key
#  attachment_id :integer          not null
#  customer_id   :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_attachment_views_on_attachment_id  (attachment_id)
#  index_attachment_views_on_customer_id    (customer_id)
#

class AttachmentView < ApplicationRecord
  belongs_to :attachment, counter_cache: :views_count
  belongs_to :customer
end
