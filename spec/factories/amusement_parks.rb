FactoryBot.define do
  factory :amusement_park do
    sequence(:name) {|n| "Default Park Name #{n}"}
    sequence(:admission_cost) {|n| "#{n}.11".to_i}
  end
end
