FactoryBot.define do
  factory :destination do
    name { Faker::Address.city }
    zip  { Faker::Address.zip }
    description  { Faker::Lorem.paragraph(sentence_count: 2) }
    image_url { Faker::LoremPixel.image  }
  end
end
