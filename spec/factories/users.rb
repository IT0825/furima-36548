FactoryBot.define do
  factory :user do
    nickname 
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name
    first_name
    last_name_kana  {'テスト'}
    first_name_kana {'テスト'}
    birth_date
  end
end