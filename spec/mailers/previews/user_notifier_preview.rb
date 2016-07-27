# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview
  def sample_mail_preview
    ExampleMailer.sample_email(User.all)
  end
end
