FactoryGirl.define do

  factory :todo_item do

    name "Test"
    done false

    list

    trait :done do
      done true
    end
  end

end
