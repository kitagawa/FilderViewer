Factory.define :user do |user|
  user.sequence(:name){|n| "user_#{n}"}
  user.password "abcdefgh"
  user.password_confirmation "abcdefgh"
end
