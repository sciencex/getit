Feature: Article Search
  In order to know find articles related to my topic
  As a user
  I want to see a search box for articles

  Scenario: Search for articles
    Given I am not logged in
    And I am on the articles page
    Then I should see "Search for Articles" in the article search section
    And I should see a search box that searches NYU's web-scale discovery tool
    And I should see a tip which explains what I am searching
