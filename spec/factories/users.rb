FactoryBot.define do
  factory :user do
    nickname { 'テスト' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { 'てすと' }
    first_name { 'てすと' }
    last_name_kana  { 'テスト' }
    first_name_kana { 'テスト' }
    birth_date { '2000-1-1' }
  end
end
