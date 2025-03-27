class Event < ApplicationRecord
  enum :status, {
    pending: 'pending',
    processing: 'processing',
    processed: 'processed',
    failed: 'failed',
    active: 'active'  # Add the active status
  }, default: 'pending'
end
