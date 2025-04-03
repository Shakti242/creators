# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  data              :json
#  processing_errors :text
#  source            :string
#  status            :integer
#  updated_at        :datetime         not null
#

class Event < ApplicationRecord
  enum :status, {
    pending: 'pending',
    processing: 'processing',
    processed: 'processed',
    failed: 'failed',
    active: 'active'  # Add the active status
  }, default: 'pending'
end
