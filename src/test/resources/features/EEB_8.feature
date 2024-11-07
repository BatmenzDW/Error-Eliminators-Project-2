@JREQ-EEB-8
Feature: Users should be able to remove Moons from the Planetarium

	@EEB-TC-4
	Scenario Outline: User Interaction - Remove Moons
	
 | Users should only be able to interact with resources they have added to the Planetarium | 
 | Planets and moons should have unique names | 
 | Moons should be "owned" by the Planet and the User adding the moon associated with it | 
 |  | 
		Given User is on the Home Page
			"""
			http://localhost:8080/planetarium
			"""
		When User selects moon from Dropdown
		When User enters moon name "<Moon Name>"
		And User clicks the delete button
		Then Moon "<Moon Name>" is deleted

	Examples: 
		| Moon Name |
		| Luna      |
		| Jira      |