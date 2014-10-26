class UserMailer < ActionMailer::Base
  default :from => "FTE"
  
  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email, :subject => "Has solicitado cambiar la contraseña")
  end
end
