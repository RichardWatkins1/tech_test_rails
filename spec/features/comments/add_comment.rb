require 'rails_helper'

feature 'adding comments' do
  context 'A visitor to the site can anonymously leave a comment' do
    after do
      remove_uploaded_file
    end
    scenario 'A visitor to the site can anonymously leave a comment' do
      sign_in_and_create_post
      click_link 'Logout'
      fill_in 'content', with: "I'm not a user but I can still comment"
      expect(page).to have_link "I'm not a user but I can still comment"
    end
  end

  context 'A user can leave a comment' do
    after do
      remove_uploaded_file
    end
    scenario 'a visitor can sign to become a user and leave a comment' do
      sign_in_and_create_post
      fill_in 'content', with: "I'm not a user but I can still comment"
      expect(page).to have_link "I'm not a user but I can still comment"
    end
  end
end