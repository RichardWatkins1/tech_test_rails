require 'fileutils'

def create_post
  visit '/posts'
    click_link 'new post'
    attach_file('Image', "spec/files/images/blog.jpg")
    fill_in 'Title', with: 'My first blog post'
    fill_in 'Body', with: 'My first blog post is rather sort although it will take much longer text'
    click_button 'Create Post'
end

def remove_uploaded_file
  FileUtils.rm_rf(Rails.root + "public/system")
end