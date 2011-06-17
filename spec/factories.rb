Factory.define :user do |u|
  u.username "fooman13"
  u.email "fooman@gmail.com"
  u.password "foobar"
  u.password_confirmation "foobar"
end

Factory.define :stock do |s|
  s.symbol "KR"
  s.price BigDecimal.new('24.00')
  s.dividend_share => BigDecimal.new('0.46')
  s.yield => BigDecimal("1.75")
  s.ex_date DateTime.now + 2.days
  s.pay_date DateTime.now + 20.days
end
