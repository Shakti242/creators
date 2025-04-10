module ApplicationHelper
  def gravatar_url
    gravatar_id = Digest::MD5.hexdigest(current_user.email.downcase)
    "https://secure.gravatar.com/avatar/#{gravatar_id}"
  end

  def menu_items
    [{
      name: 'Dashboard',
      path: '/dashboard'
    }, {
      name: 'Accounts',
      path: '/accounts'
    }, {
      name: 'Products',
      path: '/products'
    },
    {
      name: 'Store',
      path: '/store'
    },
    {
      name: 'Customers',
      path: '/customers'
    },
    {
      name: 'Cardholders',
      path: '/cardholders'
    }
  ].map do |item|
      {
        name: item[:name],
        path: item[:path],
        active: current_page?(item[:path])
      }
    end
  end
end
