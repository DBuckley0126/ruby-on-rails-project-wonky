Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1088364901995-hv124dvh8n4tcap43nho4a2sudm5u8j2.apps.googleusercontent.com', 'kuqHk9CGMaQafuctpaHLkzEP'
  {    :name => "google",
    :scope => ['contacts', 'plus.login', 'plus.me', 'email',
               'profile'],    
    :prompt => "select_account",
    :image_aspect_ratio => "square",
    :image_size => 50,
    :access_type => 'offline'  }
end