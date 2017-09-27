Feature: Finding a cell file

Background:
  Given I open the app file "app/models/user.rb"
  And file "app/concepts/user/cell/new.rb" exists
  And file "app/concepts/user/cell/edit.rb" exists
  And I turn on projectile-trailblazer-mode

Scenario: Finding user cell
  When I run command "projectile-trailblazer-find-cell" selecting "user/cell/new"
  Then I am in file "app/concepts/user/cell/new.rb"
