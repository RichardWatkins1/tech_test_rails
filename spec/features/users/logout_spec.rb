require 'rails_helper'

feature 'posts' do
  context 'viewing posts' do
    scenario 'lets a user view a post' do
      sign_in
      click_link 'Logout'
      expect(page).to have_content 'Signed out successfully.'
    end
  end
end