class HandleEventJob < ApplicationJob
  queue_as :default

  def perform(event)
    case event.source
    when 'stripe'
      handle_stripe_event(event)
    end
  end
  def handle_stripe_event(event)
    stripe_event = Stripe::Event.construct_from(event.data)
    case stripe_event.type
    # when 'account.updated'
    #   handle_account_updated(stripe_event)
    # when 'capability.updated'
    #   handle_capability_updated(stripe_event)
    when 'customer.created'
      handle_customer_created(stripe_event)
    # when 'checkout.session.completed'
    #   handle_checkout_session_completed(stripe_event)
    # when 'checkout.session.async_payment_succeeded'
    #   handle_checkout_session_completed(stripe_event)
    # when 'treasury.financial_account.features_status_updated'
    #   handle_financial_account_features_status_updated(stripe_event)
    end
  end
  def handle_customer_created(stripe_event)
    puts "customer.created #{stripe_event.data.object.id}"
  end
end