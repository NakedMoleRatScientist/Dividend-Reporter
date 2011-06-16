Feature: User stops watching a stock
  In order to stop watching a stock on my watchlist
  As a user of the dividend reporter
  I would like to remove the stock from my watchlist

 Scenario: User removes stock from his/her watchlist
    Given I am logged in
    Given I have a stock on my watchlist
    Given I am on the stocks index page
    And I follow "test@user.com"
    When I follow "remove"
    Then I should see "Stock successfully removed from watchlist"
