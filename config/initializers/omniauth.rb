OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '977374320985-vfjjttrq8b0mc88hlfgiber2d3rf0dfv.apps.googleusercontent.com', 'MKj0HyDzdfnb_zFIWW41ejRv', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
