Feature: Citation Linker
  In order to know find a specific article
  As a user
  I want to see a citation linker for articles

  Scenario: Citation linker for articles
    Given I am not logged in
    And I am on the articles page
    Then I should see "Find a Specific Article" in the citation linker section
    And I should see a citation linker form
    And I should see a tip that can help if I'm having trouble finding my article
