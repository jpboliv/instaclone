FactoryGirl.define do
  factory :notification do
    user nil
    subscribed_user nil
    post nil
    indentifier 1
    type ""
    read false
  end
end
