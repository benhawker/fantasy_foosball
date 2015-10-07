require 'rails_helper'

def sign_up(user)
  visit '/' 
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def sign_out
  click_link 'Sign out'
end

def sign_in(user)
  visit '/' 
  click_link "Sign in"
  fill_in "user[email]", with: "test@test.com"
  fill_in "user[password]", with: "password"
  click_button 'Log in'
end

feature "match" do

  let!(:user){ User.create }

  context "creating a new match" do
    it "can create a new match" do
      visit('/')
      sign_up(user)
      click_link "Create new match"
      expect(page).to have_content "Create your new matchup below"
    end
  end
end