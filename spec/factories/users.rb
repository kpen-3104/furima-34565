FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1k' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '佐藤' }
    first_name            { '次郎' }
    last_name_reading     { 'サトウ' }
    first_name_reading    { 'ジロウ' }
    birthday              { '1990-01-01' }

  end
end
