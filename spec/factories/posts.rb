# spec/factories/factories.rb

FactoryBot.define do
  factory :post do
    title { "Sample Post" }
    tetxt { "This is a sample post text." }
    comments_counter { 0 }
    likes_counter { 0 }
    association :author, factory: :user
  end
end
