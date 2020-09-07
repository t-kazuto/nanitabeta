FactoryBot.define do
  factory :restaurant do
    username      { '山田太郎' }
    day           { '2020-01-01' }
    prefecture_id { 2 }
    station       { '東京駅' }
    name          { '〇〇食堂' }
    genre         { 'ラーメン' }
    menu          { '特製醤油ラーメン' }
    price         { '1000' }
  end
  trait :image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/public/images/test_image.jpeg')) }
  end
end
