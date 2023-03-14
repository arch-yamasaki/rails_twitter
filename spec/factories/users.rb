FactoryBot.define do
  factory :user1, class: User do
    name {"User1"}
    birthday {Date.new(1980, 1, 1)}
    email {"user1@example.com"}
    password {"password1"}
  end

  factory :user2, class: User do
    name {"User2"}
    birthday {Date.new(1980, 1, 1)}
    email {"user2@example.com"}
    password {"password2"}
  end

end
