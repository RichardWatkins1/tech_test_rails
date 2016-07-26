require 'rails_helper'

feature 'posts' do
  context 'editing posts' do
    after do
      remove_uploaded_file
    end
    scenario 'delete a post' do
      sign_in_and_create_post
      click_link 'My first blog post'
      click_link "Edit blog post"
      click_link "Delete Post"
      expect(page).not_to have_content('My first blog post')
      expect(page).to have_content "Post deleted successfully."
      expect(current_path).to eq '/posts'
    end
  end
end