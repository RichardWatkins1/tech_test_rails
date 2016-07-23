require 'rails_helper'

feature 'posts' do
  context 'editing posts' do
    scenario 'let a user edit a restaurant' do
      create_post
      click_link 'Edit My first blog post'
      fill_in 'Title', with: 'My first blog post edited'
      fill_in 'Body', with: 'My first blog post body edited'
      attach_file('Image', "spec/files/images/blog.jpg")
      click_button 'Update Post'
      expect(page).to have_content 'My first blog post edited'
      expect(page).to have_content 'My first blog post body edited'
      expect(page).to have_css("img[src*='blog.jpg']")
      expect(current_path).to eq '/posts'
    end

  end
end