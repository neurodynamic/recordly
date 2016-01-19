FactoryGirl.define do
  factory :artist do
    name {Faker::Name.name}
  end

  factory :album do
    name {Faker::Company.catch_phrase}
    release_year (1950..Date.today.year).to_a.sample
  end

  factory :song do
    name {Faker::Company.catch_phrase}
  end
end