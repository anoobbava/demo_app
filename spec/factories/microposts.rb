FactoryGirl.define do
  factory :micro2, class: Micropost do
    sequence(:content) { |n| "Name#{n}" }
    sequence(:user_id) { |n| n}
  end

  factory :micro_error, class: Micropost do
    sequence(:content)  { |n| "sdfsdkjfgk#{n}"}
    user_id 'abc'
  end

  factory :micro_length, class: Micropost do
    content 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
             qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq'
    user_id 1
  end
end
