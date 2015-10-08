FactoryGirl.define do
  factory :match do
    match_name 'Match 1'
    team_one 'Ben & Bob'
    team_two 'Bill & Joe'

    factory :match_two do
      match name 'Match 2'
      team_one 'Ben & Joe'
      team_two 'Bill & Bob'
    end
  end
end
