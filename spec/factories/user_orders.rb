FactoryBot.define do
  factory :user_order do
    postal_code                {"235-0043"}
    city                       {"横浜市緑区"}
    house_number               {"青山1-1-1"}
    phone_number               {"09044336079"}
    prefecture_id              {2}
    token                      {"tok_abcdefghijk00000000000000000"}
    user_id                    {6}
    item_id                    {7}
  end
end
