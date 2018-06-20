Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '159751041536678', '83b18a57edd9e0a3875fc7133acaf479'
end
