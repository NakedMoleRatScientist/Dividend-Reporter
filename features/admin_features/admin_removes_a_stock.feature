Feature: Admin removes a stock
  In order to have a stock not show on the master list
  As an administrator of the dividend reporter
  I would like to be able to remove a stock from the master list

  Scenario: Admin removes a stock from the masterlist
    Given there is a stock with company_name: "Google, Inc."
    Given I am logged in as an administrator
    Given I am on the admin panel page
    When I follow "remove"
    Then I should see "Stock successfully removed"
