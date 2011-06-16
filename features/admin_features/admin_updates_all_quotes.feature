Feature: Admin updates all quotes
  In order to see the most current information
  As an administrator on the dividend reporter
  I would like to be able to update all quotes at one time

  Scenario: Admin update all quotes at one time
    Given there is a stock with company_name: "Google Inc."
    Given I am logged in as an administrator
    Given I am on the admin panel page
    When I follow "Update all quotes"
    Then I should see "All quotes successfully updated"
