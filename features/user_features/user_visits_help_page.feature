Feature: user views the help page

  Scenario: User should see help page when following help page link
    Given I am on the stocks index page
    When I follow "Help"
    Then I should see "help page"
