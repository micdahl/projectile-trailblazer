Feature: Enabling projectile-trailblazer mode
  In order to use the mode
  As a user
  I want it to be turned on when inside a rails project alongside projectile minor mode

  Scenario: Turning off
    Given I open the app file "/app/models/user.rb"
    When I turn on projectile-trailblazer-mode
    Then projectile-trailblazer should be turned on
    When I turn off projectile-trailblazer-mode
    Then projectile-trailblazer should not be turned on
