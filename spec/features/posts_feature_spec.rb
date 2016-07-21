require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post as no posts added yet' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a blog post'
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