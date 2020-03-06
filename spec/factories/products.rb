FactoryBot.define do
  factory :product do
    category { "Burgers" }
    name { "Cheeseburger" }
    description { "Bun, meat and cheese" }
    price { 100 }
  end
end
