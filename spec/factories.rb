# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Dillon Hafer"
  user.email                 "dhafer@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
