FactoryBot.define do
  factory :item do
    association :user, factory: :user                      
    name                       { "あつや" }
    description                {"うんこ"}
    category_id                {2}
    condition_id               {2}
    handleng_time_id           {2}
    postage_payer_id           {2}
    prefecture_id              {2}
    price                      {700}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
