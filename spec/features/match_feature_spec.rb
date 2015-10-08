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

  context 'no matches have been added' do
    scenario 'should display a prompt to add a match' do
      visit('/')
      sign_up(user)
      click_link "Create new match"
      expect(page).to have_content "Create your new matchup below"
    end
  end

  context 'matches have been added' do
    before do
      Match.create(match_name: 'Matchup 1')
    end

    scenario 'display matches' do
      visit '/'
      sign_up(user)
      expect(page).to have_content('Matchup 1')
      expect(page).not_to have_content('No Matchups created')
    end
  end

  context "creating a new match" do
    before do
      Team.create(player_one: 'Ben', player_two: 'Bob')
      Team.create(player_one: 'Bill', player_two: 'Joe')
    end

    it "can fill in match details and save them" do
      visit('/')
      sign_up(user)
      click_link "Create new match"
      fill_in "match[match_name]", with: "Test Match"
      select('Ben & Bob', :from => 'match[team_one]')
      select('Bill & Joe', :from => 'match[team_two]')
      select('10', :from => 'match[team_one_score]')
      select('2', :from => 'match[team_two_score]')
      click_button "Create Match!"
      expect(page).to have_content "Match created successfully"
      expect(current_path).to eq '/'
    end
  end

  context 'viewing matches' do
    let! (:team_one){ Team.create(player_one: 'Ben', player_two: 'Bob') }
    let! (:team_two){ Team.create(player_one: 'Bill', player_two: 'Joe') }

    let! (:match){ Match.create(match_name: "Matchup 1", team_one: team_one, team_two: team_two) }

    scenario 'lets a user view a match' do
     visit '/'
     sign_up(user)
     click_link 'Matchup 1'
     expect(current_path).to eq "/matches/#{match.id}"
    end
  end

  context 'editing matches' do

  let!(:match){ Match.create(match_name: 'Matchup 1') }

    scenario 'let a user edit a match' do
     visit '/'
     sign_up(user)
     click_link 'Edit Matchup 1'
     fill_in "match[match_name]", with: "Matchup 2"
     click_button 'Update Match!'
     expect(page).to have_content 'Matchup 2'
     expect(page).to have_content 'Match updated successfully'
     expect(current_path).to eq '/'
    end
  end

  context 'deleting matches' do

  let!(:match){ Match.create(match_name: 'Matchup 1') }

    scenario 'removes a match when a user clicks a delete link' do
      visit '/'
      sign_up(user)
      click_link 'Delete Matchup 1'
      expect(page).not_to have_content 'Matchup 1'
      expect(page).to have_content 'Match deleted successfully'
    end
  end
end