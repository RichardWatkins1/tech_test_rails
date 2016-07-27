class UserNotifierMailer < ApplicationMailer
  default from: "from@example.com"


  def sample_email(user)
    @user = user
    p @user
    @url = 'http://www.google.com'
    mail(to: @user.email, subject: 'Sample Email')
  end

end
