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

context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new post' do
    visit '/posts'
    click_link 'Add a blog post'
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'My first blog post is rather sort although it will take much longer text'
    click_button 'Create Post'
    expect(page).to have_content 'My first blog post'
    expect(current_path).to eq '/posts'
  end
end

context 'viewing restaurants' do

  let!(:first_post){ Post.create(title:'My first blog post') }

  scenario 'lets a user view a post' do
   visit '/posts'
   click_link 'My first blog post'
   expect(page).to have_content 'My first blog post'
   expect(current_path).to eq "/posts/#{first_post.id}"
  end
end

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
