require 'rails_helper'

feature 'posts' do
  context 'editing posts' do

    before { Post.create title: 'My first blog post', body: 'My first blog post is rather sort although it will take much longer text' }

    scenario 'let a user edit a restaurant' do
      visit '/posts'
      click_link 'Edit My first blog post'
      fill_in 'Title', with: 'My first blog post edited'
      fill_in 'Body', with: 'My first blog post body edited'
      click_button 'Update Post'
      expect(page).to have_content 'My first blog post edited'
      expect(page).to have_content 'My first blog post body edited'
      expect(current_path).to eq '/posts'
    end

  end
end