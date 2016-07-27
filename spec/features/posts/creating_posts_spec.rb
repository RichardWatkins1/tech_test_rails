require 'rails_helper'

feature 'creating posts' do
  context 'no posts have been added' do
    scenario 'should display links to login and register as new visitor' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Register'
      expect(page).to have_link 'Login'
    end
  end

  context 'creating posts' do
    after do
      remove_uploaded_file
    end
    scenario 'a user signs up then creates new post' do
      sign_in_and_create_post
      expect(page).to have_content 'My first blog post'
      expect(page).to have_content "Your post has been created!"
      expect(page).not_to have_content("Your new post couldn't be created!  Please check the form.")
      expect(current_path).to eq '/posts'
      expect(page).to have_css("img[src*='blog.jpg']")
    end
  end

  context 'creating posts' do
    after do
      remove_uploaded_file
    end
    scenario 'a user signs up trys to creates new post but misses out the image' do
      sign_in_bad_create_post
      expect(page).to have_content "Your new post couldn't be created! Please check the form."
    end
  end
end