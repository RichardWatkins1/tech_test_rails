# README

[![Build Status](https://travis-ci.org/RichardWatkins1/tech_test_rails.svg?branch=master )](https://travis-ci.org/RichardWatkins1/tech_test_rails)

[![Coverage Status](https://coveralls.io/repos/github/RichardWatkins1/tech_test_rails/badge.svg)](https://coveralls.io/github/RichardWatkins1/tech_test_rails)

Tech test Rails
---------------

## Installation

- clone repository into directory using git clone https://github.com/RichardWatkins1/tech_test_rails.git
- run bundle to install dependencies
- run bin/rake db:create to create databases
- run bin/rake db:migrate to set up migrations in development environment
- run bin/rake db:migrate RAILS_ENV=test to set up migrations in test environment
- run bin/rails s to start the server
- visit http://localhost:3000/ to view website
- If using gmail for emails 2 step-verification must be turned off

## Testing

- once installation is complete run rspec.

A feature test example can be found below:

```
feature 'creating posts' do
  context 'no posts have been added' do
    scenario 'should display links to login and register as new visitor' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Register'
      expect(page).to have_link 'Login'
    end
  end
end
```
