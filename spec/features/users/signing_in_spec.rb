require 'rails_helper'

feature 'signing in' do
  context 'A user can sign in' do
    scenario 'a user can successfully sign in' do
      sign_in
      expect(page).to have_content 'Welcome! You have signed up successfully.'
      expect(page).to have_link 'new post'
      expect(current_path).to eq '/'
    end
  end

  context 'A user tries to sign in with an incorrect email' do
    scenario 'a user tries to sign in with an incorrect email' do
      sign_in_wrong_email
      expect(page).to have_content 'Please review the problems below:'
      expect(page).to have_content 'is invalid'
      expect(current_path).to eq '/users'
    end
  end

end