require 'rails_helper'

feature 'adding comments' do
  context 'A visitor to the site can anonymously leave a comment' do
    scenario 'A visitor to the site can anonymously leave a comment' do
      sign_in_and_create_post
      click_link 'Logout'
      fill_in 'content', with: "I'm not a user but I can still comment"
      expect(page).to have_link "I'm not a user but I can still comment"
    end
  end
end