FactoryGirl.define do
  
  factory :user1, class: User do
    # email 'aaaa@gmail.com'
    name 'anoob'
    sequence(:email) { |n| "an#{n}@gmail.com" }
  end

  factory :user_error, class: User do
    id 'dsffsd'
    name 'error'
    email nil
  end
end
