FactoryBot.define do
  factory :post do
    association :user

    content { FFaker::Lorem.sentence}
    image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/specimage.jpg'))}

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/spectxt.txt'))}
    end
  end
end