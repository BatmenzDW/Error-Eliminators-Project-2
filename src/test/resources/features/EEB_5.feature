@EEB-5
Feature: EEB-5

	@EEB-TC-8 @JREQ-EEB-13 @AIO-FOLDER-EEB-5
	Scenario Outline: Adding Planets - Planet Name Length
		Given User is on the Home Page
		When User clicks the Moon Dropdown option
		When User clicks Planet from the dropdown
		When User provides a Planet Name "<Planet Name>"
		When User clicks Submit Planet
		Then The User is given an Alert with text "<Alert Text>"
		And Planet Add <Result>

	Examples: 
		| Planet Name                     | Alert Text                       | Result  |
		|                                 | Planet created with Name         | Success |
		| PlanetNameWithThirtyCharacters  | Planet created with Name         | Success |
		| PlanetNameOfThirtyOneCharacters | Planet creation failed with Name | Fail    |

	@EEB-TC-9 @AIO-FOLDER-EEB-5
	Scenario Outline: Adding Planets - Unique Planet Names
		Given User is on the Home Page
		And Planet with name "<Planet Name>" <Exists> in database
		When User clicks the Moon Dropdown option
		Then User clicks Planet from the dropdown
		Then User provides a Planet Name "<Planet Name>"
		And User clicks Submit Planet
		Then The User is given an Alert with text "<Alert Text>"
		And Planet Add <Result>

	Examples: 
		| Planet Name | Exists        | Alert Text                          | Result  |
		| Krypton     | Doesn't Exist | Planet added successfully with name | Success |
		| Venus       | Exists        | Planet add failed with name         | Failed  |

	@EEB-TC-10 @AIO-FOLDER-EEB-5
	Scenario Outline: Adding Planets - Planet Ownership
		Given User is on the Home Page
		When User clicks the Moon Dropdown option
		When User clicks Planet from the dropdown
		When User provides a Planet Name "<Planet Name>"
		When User clicks Submit Planet
		Then The User is given an Alert with text "<Alert Text>"

	Examples: 
		| Planet Name | Alert Text               | Result  |
		| Tamaran     | Planet created with Name | Success |

	@EEB-TC-11 @JREQ-EEB-14 @AIO-FOLDER-EEB-5
	Scenario Outline: Adding Planets - Image Association
		Given User is on the Home Page
		When User clicks the Moon Dropdown option
		When User clicks Planet from the dropdown
		When User provides a Planet Name "<Planet Name>"
		When User provides an image <Can Add Image>
		When User clicks Submit Planet
		Then Planet Add <Result>

	Examples: 
		| Planet Name | Can Add Image | Result  |
		| Pluto       | Yes           | Success |
		| Saturn      | No            | Success |