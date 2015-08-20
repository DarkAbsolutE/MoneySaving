OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
  {
      client_id: '977374320985-vfjjttrq8b0mc88hlfgiber2d3rf0dfv.apps.googleusercontent.com',
       client_secret: 'MKj0HyDzdfnb_zFIWW41ejRv',
       access_type: 'offline',
       approval_prompt: 'auto',
       hd: 'crowdint.com'
  }


end
