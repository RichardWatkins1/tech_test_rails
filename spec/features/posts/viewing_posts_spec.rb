require 'rails_helper'

feature 'posts' do
  context 'viewing posts' do
    let!(:first_post){ Post.create(title:'My first blog post') }
    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'My first blog post'
      expect(page).to have_content 'My first blog post'
      expect(current_path).to eq "/posts/#{first_post.id}"
    end
  end
end