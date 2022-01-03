FactoryBot.define do
  factory :mechanic do
    sequence(:name) { |n| "Default Mechanic Name #{n}" }
    sequence(:years_experience) { |n| (n + 5) }
  end
end
