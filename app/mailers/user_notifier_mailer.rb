class UserNotifierMailer < ApplicationMailer
  default from: "from@example.com"


  def sample_email(user, post)
    @user = user
    @post = post
    @url = 'http://www.google.com'
    mail(to: @user.email, subject: 'Sample Email')
  end

end
