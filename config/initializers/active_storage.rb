Rails.application.config.after_initialize do
  ActiveStorage::Current.url_options = {
    host: 'http://localhost:3000', # Replace with your app's host
    protocol: 'http'
  }
end