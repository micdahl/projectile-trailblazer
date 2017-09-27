Feature: Finding a contract file

Background:
  Given I open the app file "app/models/user.rb"
  And file "app/concepts/user/contract/create.rb" exists
  And file "app/concepts/user/contract/edit.rb" exists
  And I turn on projectile-trailblazer-mode

Scenario: Finding user cell
  When I run command "projectile-trailblazer-find-contract" selecting "user/contract/create"
  Then I am in file "app/concepts/user/contract/create.rb"
