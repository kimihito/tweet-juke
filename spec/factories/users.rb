# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    image_url "MyString"
  end
  factory :user2, class: User do
    name "MyString"
    image_url "MyString"
  end
end
