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

context 'posts have been added' do
  before do
    Post.create(title: 'My first blog post')
  end
  scenario 'display posts' do
    visit '/posts'
    expect(page).to have_content('My first blog post')
    expect(page).not_to have_content('No posts yet')
  end
end

context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new post' do
    visit '/posts'
    click_link 'new post'
    attach_file('Image', "spec/files/images/blog.jpg")
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'My first blog post is rather sort although it will take much longer text'
    click_button 'Create Post'
    expect(page).to have_content 'My first blog post'
    expect(current_path).to eq '/posts'
     expect(page).to have_css("img[src*='blog.jpg']")
  end
end