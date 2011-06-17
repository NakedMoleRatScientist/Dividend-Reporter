Factory.define :user do |u|
  u.username "fooman13"
  u.email "fooman@gmail.com"
  u.password "foobar"
  u.password_confirmation "foobar"
end

Factory.define :admin do |a|
  u.username "admin"
  u.email "admin@example.com"
  u.password "foobar"
  u.password_confirmation("foobar")
  u.admin true
end
