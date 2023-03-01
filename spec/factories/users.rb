FactoryBot.define do
  factory :user1 do
    name {"User1"}
    birthday {Date.new(1980, 1, 1)}
  end

  factory :user2 do
    name {"User2"}
    birthday {Date.new(1980, 1, 1)}
  end

end
