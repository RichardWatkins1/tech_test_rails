require "rails_helper"

RSpec.describe UserNotifierMailer, type: :mailer do
  describe 'instructions' do
    let(:user) {  double(:user, email: 'lucas@email.com', user_name: 'Lucas') }
    let(:mail) { described_class.sample_email(user).deliver_now }

    it 'renders the receiver email' do
      expect(mail.to).to eq([user.email])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(user.user_name)
    end
  end
end
