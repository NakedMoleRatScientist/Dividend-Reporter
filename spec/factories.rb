Factory.define :user do |u|
  u.username "fooman13"
  u.email "fooman@gmail.com"
  u.password "foobar"
  u.password_confirmation "foobar"
end

Factory.define :admin do |a|
  a.username "admin"
  a.email "admin@example.com"
  a.password "foobar"
  a.password_confirmation("foobar")
  a.admin true
end
