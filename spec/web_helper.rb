require 'fileutils'

def create_post
    click_link 'new blog post'
    attach_file('Image', "spec/files/images/blog.jpg")
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'My first blog post is rather sort although it will take much longer text'
    click_button 'Create Post'
end

def sign_in_and_create_post
  visit '/'
  click_link 'Register'
  fill_in 'Email', with: 'bob@bob.com'
  fill_in 'Username', with: 'bobbobson'
  fill_in 'Password', with: 'testtest'
  fill_in 'Confirm Password', with: 'testtest'
  click_button 'Sign up'
  click_link 'new blog post'
  attach_file('Image', "spec/files/images/blog.jpg")
  fill_in 'Title', with: 'My first blog post'
  fill_in 'Body', with: 'My first blog post is rather sort although it will take much longer text'
  click_button 'Create Post'
end

def sign_in
  visit '/'
  click_link 'Register'
  fill_in 'Email', with: 'bob2@bob.com'
  fill_in 'Username', with: 'bobbobson2'
  fill_in 'Password', with: 'testtest'
  fill_in 'Confirm Password', with: 'testtest'
  click_button 'Sign up'
end

def sign_in_wrong_email
  visit '/'
  click_link 'Register'
  fill_in 'Email', with: 'bob'
  fill_in 'Username', with: 'bobbobson'
  fill_in 'Password', with: 'testtest'
  fill_in 'Confirm Password', with: 'testtest'
  click_button 'Sign up'
end

def remove_uploaded_file
  FileUtils.rm_rf(Rails.root + "public/system")
end