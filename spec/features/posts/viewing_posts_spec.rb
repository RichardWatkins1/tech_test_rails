require 'rails_helper'

feature 'posts' do
  context 'viewing posts' do
    scenario 'lets a user view a post' do
      create_post
      click_link 'My first blog post'
      expect(page).to have_content 'My first blog post'
    end
  end
end