require 'rails_helper'

feature 'creating posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post as no posts added yet' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'new post'
    end
  end
end

context 'creating posts' do
  after do
    remove_uploaded_file
  end
  scenario 'prompts user to fill out a form, then displays the new post' do
    create_post
    expect(page).to have_content 'My first blog post'
    expect(page).to have_content "Your post has been created!"
    expect(current_path).to eq '/posts'
    expect(page).to have_css("img[src*='blog.jpg']")
  end
end