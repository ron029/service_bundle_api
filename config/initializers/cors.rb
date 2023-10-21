# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://service-bundle-backend.vercel.app' # Replace with your frontend's URL
    resource '/api/*',
      # origins 'http://localhost:8080'
      # resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
