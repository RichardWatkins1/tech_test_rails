require "rails_helper"

RSpec.describe UserNotifierMailer, type: :mailer do
  describe 'instructions' do
    let(:user) {  double(:user, email: 'lucas@email.com', user_name: 'Lucas') }
    let(:post) { double(:post, title: 'my first blog post') }
    let(:mail) { described_class.sample_email(user, post).deliver_now }

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.user_name)
    end
  end
end
