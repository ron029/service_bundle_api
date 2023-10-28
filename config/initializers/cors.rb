# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://service-bundle-backend.vercel.app' # Replace with your frontend's URL
    resource '/api/*', headers: :any, methods: %i[get post put patch delete options head], credentials: true
    # origins 'http://localhost:8080'
    # resource '*',
  end
end
