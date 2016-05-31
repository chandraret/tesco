#jira user story number

@tesco_search

Feature: Tesco groceiries search panel

  As a customer,
  I want to be able to search the product,
  So that I can book online

  Scenario: Results for the searched product to be displayed
    Given I am on the tesco groceries page
    When I enter required product in search field eg "bread"
    And I click on search button
    Then I should see the required product in search results

  Scenario: Check the correct error validation is displayed with incorrect data entered in search field
    Given I am on the tesco groceries page
    When I enter an incorrect product in search field eg "somexyz"
    And I click on search button
    Then I should see the error validation message as "No results for 'somexyz'"

  Scenario: Check alert message is displayed without entering data in search box
    Given I am on the tesco groceries page
    When I click on search button
    Then I should see message as "Please enter a search term"

  Scenario: Check specific search results will display on clicking area filter
    Given I am on the tesco groceries page
    When I enter required product in search field eg "bread"
    And I click on search button
    And I click a filter from area filter section
    Then I should see for the selected product only in search results

  Scenario: Check specific search results will display on clicking popular filter
    Given I am on the tesco groceries page
    When I enter required product in search field eg "bread"
    And I click on search button
    And I click on new products filter from popular filter section
    Then I should see new products only in search results

  @no_implementation
  Scenario: Check order of search results in alphabetical order when we select a filter
    Given I am on the tesco groceries page
    When I enter required product in search field eg "bread"
    And I click on search button
    And I select an alphabetical a-z category via sort by filter
    And I click on go button
    Then I should see displayed search resilts in alphabetical order a-z

  @no_implementation
  Scenario: Check the functionality of expandable search list item
    Given I am on the tesco groceries page
    When I expand on search with a list of items
    And I enter list of items to buy
    And I click on find these items button
    Then I should see the required products in search results

  @no_implementation
  Scenario: Check low to high price filter functionality
    Given I am on the tesco groceries page
    When I enter required product in search field eg "bread"
    And I click on search button
    And I select price low to high via sort by filter
    And I click on go button
    Then I should see displayed search resilts from low to high prices

  @no_implementation
  Scenario: Check high to low price filter functionality
    Given I am on the tesco groceries page
    When I enter required product in search field eg "bread"
    And I click on search button
    And I select price high to low via sort by filter
    And I click on go button
    Then I should see displayed search resilts from high to low prices



