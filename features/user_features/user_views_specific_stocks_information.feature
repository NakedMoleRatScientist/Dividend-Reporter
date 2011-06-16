Feature: User views a specific stock's information
  In order to research a stock
  As a user of the dividend reporter
  I would like to be able to view an individual stock's information page

  Scenario: user views a stock's show page
    Given I am logged in
    Given there is a stock with company_name: "Google, Inc."
    Given I am on the stocks index page
    When I follow "Google, Inc."
    Then I should see "Stock Information : Google, Inc."

