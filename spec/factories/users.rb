FactoryGirl.define do
  factory :user do
    email 'test_user@test.com'
    first_name 'ben'
    password 'testtest'
    password_confirmation 'testtest'

    factory :user_two do
      email 'test_user_two@test.com'
      first_name 'bob'
    end
    
    factory :user_three do
      email 'test_user_three@test.com'
      first_name 'bill'
    end
  end
end