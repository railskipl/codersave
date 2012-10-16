Rails.application.config.middleware.use OmniAuth::Builder do
  # Adding the facebook key for Omniauth.

  provider :facebook, '407701972628459', 'baa6c5809a01fa35c4c01e11eae0cd44', {:scope => 'email,friends_likes, friends_status, offline_access'}
end

  