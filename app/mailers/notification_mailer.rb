class NotificationMailer < ApplicationMailer
  default to: -> { User.pluck(:email_address) },
          from: "yashkhunt66@gmail.com"
  def notify (article)
    #for test http://localhost:3000/rails/mailers/notification_mailer/notify
    # also remove (article) from def notify(article)
    #@article = Article.last

    #for app
    @article = article
    mail(subject: "new article: #{@article.title}")
  end


#for sending mail individualy
=begin
  def notify(article)
    @users = User.all
    @article = article
    @users.each do |user|
      @name = user.name
      mail(:to => user.email_address,
            :subject => "new article: #{@article.title}")
    end
  end
=end
end
