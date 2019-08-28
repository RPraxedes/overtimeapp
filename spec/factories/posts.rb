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
end
