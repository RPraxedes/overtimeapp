FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'first post'
    overtime_request 3.4
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale 'second post'
    overtime_request 0.5
    user
  end

  factory :post_from_others, class: "Post" do
    date Date.today
    rationale 'third post'
    unauthorized_user
  end
end
