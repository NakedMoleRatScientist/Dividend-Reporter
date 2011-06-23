Factory.define :user do |u|
  u.username "fooman13"
  u.email "test@user.com"
  u.password "foobar"
  u.password_confirmation "foobar"
end

Factory.define :stock do |s|
  s.symbol "GOOG"
  s.company_name "Google Inc."
end

Factory.define :quote do |q|
  q.stock_id 1
  q.price BigDecimal.new("24.00")
  q.dividend_share BigDecimal.new('0.46')
  q.yield BigDecimal("1.75")
  q.ex_date DateTime.now + 2.days
  q.pay_date DateTime.now + 20.days
end

