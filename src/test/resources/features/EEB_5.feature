@JREQ-EEB-5
Feature: Users should be able to add new Planets to the Planetarium

	@EEB-TC-8
	Scenario Outline: Adding Planets - Planet Name Length
		Given User is on the Home Page
		When User clicks the Moon Dropdown option
		When User clicks Planet from the dropdown
		Then User provides a Planet Name "<Planet Name>"
		Then User clicks Sumbit Planet
		And Planet Add <Result>

	Examples: 
		| Planet Name                     | Alert Text                       | Result  |
		|                                 | Planet created with Name         | Success |
		| PlanetNameWithThirtyCharacters  | Planet created with Name         | Success |
		| PlanetNameOfThirtyOneCharacters | Planet creation failed with Name | Fail    |

	@EEB-TC-9
	Scenario Outline: Adding Planets - Unique Planet Names
		Given User is on the Home Page
		And Planet with name "<Planet Name>" <Exists> in database
		When User clicks the Moon Dropdown option
		Then User clicks Planet from the dropdown
		Then User provides a Planet Name "<Planet Name>"
		And User clicks Sumbit Planet
		Then The User is given an Alert with text "<Alert Text>"
		And Planet Add <Result>

	Examples: 
		| Planet Name | Exists        | Alert Text                          | Result  |
		| Earth       | Doesn't Exist | Planet added successfully with name | Success |
		| Venus       | Exists        | Planet add failed
 with name        | Failed  |

	@EEB-TC-11
	Scenario Outline: Adding Planets - Image Association
		Given User is on the Home Page
		When User clicks the Moon Dropdown option
		When User clicks Planet from the dropdown
		Then User provides a Planet Name <Planet Name>

	Examples: 
		| Planet Name | Can Add Image | Result  |
		| Pluto       | Yes           | Success |
		| Saturn      | No            | Fail    |