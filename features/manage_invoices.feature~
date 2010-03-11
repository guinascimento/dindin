Feature: Manage Invoices
  In order to manage invoices
  As a system's user
  I want to create, update and delete invoices

  Scenario: Register new invoice
		Given I am an user
		And I am on the main page
    And I follow "New Invoice"
    Then I fill in "name" with "Sky"
    And I fill in "value" with "100"
    And I fill in "expiration date" with "01-02-2010"
    Then I press "Create"
    Then I should see "Sky"

  Scenario: Remove a invoice
		Given I am an user
		And I am on the main page
    And I follow "New Invoice"
    Then I fill in "name" with "Sky"
    And I fill in "value" with "100"
    And I fill in "expiration date" with "01-02-2010"
    Then I press "Create"
    Then I should see "Sky"
		And I should see "Debt: R$ 100,00"
    Then I follow "Remove"
    And I should see "Salary: R$ 5.000,00"
