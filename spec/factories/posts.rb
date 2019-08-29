FactoryGirl.define do
  factory :post do
    date Date.today
    rationale 'first post'
    user
  end

  factory :second_post, class: "Post" do
    date Date.yesterday
    rationale 'second post'
    user
  end

  factory :post_from_others, class: "Post" do
    date Date.today
    rationale 'third post'
    unauthorized_user
  end
end
