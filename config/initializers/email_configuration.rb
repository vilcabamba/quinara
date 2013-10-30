ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "shiriculapo.com",
  :user_name            => "bot@shiriculapo.com",
  :password             => "bot_robot@shiriculapo",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
