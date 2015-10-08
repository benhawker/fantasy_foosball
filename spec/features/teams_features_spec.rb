require 'rails_helper'

def sign_up(user)
  visit '/' 
  click_link 'Sign up'
  fill_in "user[first_name]", with: "Ben"
  fill_in "user[last_name]", with: "Hawker"
  fill_in "user[user_name]", with: "bhawker"
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
  let!(:user2){ User.create(first_name: "Bob") }

  context 'no teams have been added' do
    scenario 'should display a prompt to add a team' do
      visit('/')
      sign_up(user)
      click_link "Create new team"
      expect(page).to have_content "Create your new team below"
    end
  end

  context 'teams have been added' do
    before do
      Team.create(player_one: 'Ben', player_two: 'Bob')
    end

    scenario 'display teams' do
      visit '/'
      sign_up(user)
      visit '/teams'
      expect(page).to have_content('all the teams that have played together')
      expect(page).not_to have_content('No teams created')
    end
  end

  context "creating a new team" do
    it "can fill in team details and save them" do
      visit('/')
      sign_up(user)
      click_link "Create new team"
      select('Ben', :from => 'team[player_one]')
      select('Ben', :from => 'team[player_two]')
      click_button "Create Team!"
      expect(page).to have_content "Team created successfully"
      expect(current_path).to eq '/teams'
    end
  end

   context "viewing a team" do
    it "can view a team and see all their previous matches" do
      visit('/')
      sign_up(user)
      click_link "Create new team"
      select('Ben', :from => 'team[player_one]')
      select('Ben', :from => 'team[player_two]')
      click_button "Create Team!"
      click_link "Ben & Ben"
      expect(page).to have_content("Team Records for Ben & Ben")
      expect(page).to have_content("")
    end
  end
end