class PasswordsMailer < ApplicationMailer
  def reset(user)
    # for app
    #@user = user

    # for test on http://localhost:3000/rails/mailers/passwords_mailer/reset
    @user = User.last
    mail subject: "Reset your password", to: user.email_address
  end
end
