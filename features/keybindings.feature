Feature: Keybindings

  Scenario: Having the find keybindings setup after enabling the mode
    Given I open the app file "app/models/foo.rb"
    When I turn on projectile-trailblazer-mode
    Then key "C-c ; c" should be mapped to "projectile-trailblazer-find-cell"
    Then key "C-c ; t" should be mapped to "projectile-trailblazer-find-contract"
    Then key "C-c ; o" should be mapped to "projectile-trailblazer-find-operation"
    Then key "C-c ; v" should be mapped to "projectile-trailblazer-find-view"
