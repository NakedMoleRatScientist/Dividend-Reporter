Given /^I am logged in as an administrator$/ do
  Factory(:user, :admin => true)
  visit login_path
  fill_in("username", :with => "fooman13")
  fill_in("password", :with => "foobar")
  click_button("Login")
end
 
