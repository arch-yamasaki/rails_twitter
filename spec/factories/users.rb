FactoryBot.define do
  factory :user, class: User do
    name {"User"}
    birthday {Date.new(1980, 1, 1)}
    email {"user@example.com"}
    password {"password_user"}
  end

  factory :other_user, class: User do
    name {"OtherUser"}
    birthday {Date.new(2000, 1, 1)}
    email {"other_user@example.com"}
    password {"password_othere"}
  end

end
