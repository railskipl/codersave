Rails.application.config.middleware.use OmniAuth::Builder do
  # Adding the facebook key for Omniauth.
<<<<<<< HEAD
  provider :facebook, '407701972628459', 'baa6c5809a01fa35c4c01e11eae0cd44', 
  {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end
=======
  provider :facebook, '407701972628459', 'baa6c5809a01fa35c4c01e11eae0cd44', {:scope => 'email, read_stream, read_friendlists, friends_likes, friends_status, offline_access'}
end
>>>>>>> 309893d1f9cf7489e6f74166089862e350fa09c7
