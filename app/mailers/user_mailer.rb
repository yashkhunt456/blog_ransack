class UserMailer < ApplicationMailer

  #after_deliver :mark_delivered

  default from: email_address_with_name("yashkhunt66@gmail.com", "Bookhub.com")

  def welcome_email
    # for app
    @user = params[:user]
    
    # for test on http://localhost:3000/rails/mailers/passwords_mailer/reset
    #@user = User.last
    
    #raise ArgumentError, "User is required for welcome_email" if @user.nil?
  
    attachments["latter_A.jpg"] = File.read("/home/yash/blog/public/Letter_A.jpg")
    @url  = 'http://localhost:3000/users/new'
    mail(to: @user.email_address,
         subject: 'Welcome to My Awesome Site')
  end
=begin
  private

  def mark_delivered
    User.last.touch(:deliver_at)
  end


  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to MyApp!')
  end
=end
end
