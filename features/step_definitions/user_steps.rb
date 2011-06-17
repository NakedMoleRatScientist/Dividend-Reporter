Given /^I am logged in as an administrator$/ do
  User.create!(Factory(:user).merge(:admin => true))
  login("admin","crazy")
end
