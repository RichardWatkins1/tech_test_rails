require 'rails_helper'

feature 'posts' do
  context 'editing posts' do
    scenario 'let a user edit a restaurant' do
      create_post
      click_link 'Edit My first blog post'
      click_link "Delete Post"
      expect(page).not_to have_content('My first blog post')
      expect(page).to have_content "Post deleted successfully."
      expect(current_path).to eq '/posts'
    end
  end
end