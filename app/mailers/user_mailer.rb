class UserMailer < ActionMailer::Base
  default from: "dnyanarthlonkar@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
 def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset for Codersave"
 end
 
 def authenticate_registration(user)
    @user = user
    @url  = is_authenticated_user_url(user.id)
    mail :to => user.email, :subject => "Authentication Link For Codersave."
 end


end
