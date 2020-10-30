FactoryBot.define do
  factory :user do
    nickname                       { "あつや" }
    last_name                      { "中田" }
    first_name                     { "敦也" }
    last_name_kana                 { "ナカダ" }
    first_name_kana                { "アツヤ" }
    birth_date                     { "2000-01-01" }
    email                          { "sample7011@gmail.com" }
    password                       { "atsu7011" }
    encrypted_password             { "atsu7011" }
  end
end