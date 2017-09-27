Feature: Keybindings

  Scenario: Having the find keybindings setup after enabling the mode
    Given I open the app file "app/models/foo.rb"
    When I turn on projectile-trailblazer-mode
    Then key "C-c t c" should be mapped to "projectile-trailblazer-find-cell"
    Then key "C-c t t" should be mapped to "projectile-trailblazer-find-contract"
    Then key "C-c t o" should be mapped to "projectile-trailblazer-find-operation"
    Then key "C-c t v" should be mapped to "projectile-trailblazer-find-view"
