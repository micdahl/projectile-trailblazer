Feature: Finding a operation file

Background:
  Given I open the app file "app/models/user.rb"
  And file "app/concepts/user/operation/create.rb" exists
  And file "app/concepts/user/operation/edit.rb" exists
  And I turn on projectile-trailblazer-mode

Scenario: Finding user cell
  When I run command "projectile-trailblazer-find-operation" selecting "user/operation/create"
  Then I am in file "app/concepts/user/operation/create.rb"
