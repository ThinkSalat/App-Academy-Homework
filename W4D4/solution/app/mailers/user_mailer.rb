class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'http://99cats.com'
    mail(to: user.username, subject: 'this is the first of many emails from us')


  end

end
