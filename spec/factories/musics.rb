# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invalid_url, class: Music do
    title "invalid_url"
    url "aaa"
  end
  factory :valid_url, class: Music do
    title "hogeee"
    url "http://www.youtube.com/watch?v=f5-JJHyzROA"
  end
end
