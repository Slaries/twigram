require 'factory_bot'
require 'ffaker'

FactoryBot.define do
  factory :post do
    association :user

    content { FFaker::Lorem.sentence}
    image {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/rspecimage.jpg'))}

    trait(:with_invalid_image) do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/rspectxt.txt'))}
    end
  end
end