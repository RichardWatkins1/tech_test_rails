class ApplicationMailer < ActionMailer::Base
  default :from => 'yourgmail@gmail.com'
  layout 'mailer'
end
