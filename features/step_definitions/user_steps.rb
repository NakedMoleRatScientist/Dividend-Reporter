Given /^I am logged in as an administrator$/ do
  User.create!(Factory(:admin))
  login("admin","crazy")
end
