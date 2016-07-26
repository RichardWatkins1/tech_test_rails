require 'rails_helper'

feature 'editing posts' do
  context 'editing posts' do
    after do
      remove_uploaded_file
    end
    scenario 'let a user edit a post that they have created' do
      sign_in_and_create_post
      click_link 'My first blog post'
      click_link 'Edit blog post'
      fill_in 'Title', with: 'My first blog post edited'
      fill_in 'Body', with: 'My first blog post body edited'
      attach_file('Image', "spec/files/images/blog.jpg")
      click_button 'Update Post'
      expect(page).to have_content 'My first blog post edited'
      expect(page).to have_content 'My first blog post body edited'
      expect(page).to have_content "Post updated."
      expect(page).not_to have_content("Update failed.  Please check the form.")
      expect(page).to have_css("img[src*='blog.jpg']")
      expect(current_path).to eq '/posts'
    end
  end

  context 'editing posts' do
    after do
      remove_uploaded_file
    end
    scenario "a user can't edit a post they didn't create" do
      sign_in_and_create_post
      click_link 'Logout'
      sign_in
      click_link 'My first blog post'
      expect(page).to have_link 'cancel'
      expect(page).not_to have_link 'Edit blog post'
    end
  end
end