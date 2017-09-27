Feature: Finding a view file

Background:
  Given I open the app file "app/models/user.rb"
  And file "app/concepts/user/view/show.html" exists
  And file "app/concepts/user/view/index.slim" exists
  And I turn on projectile-trailblazer-mode

Scenario: Finding user view
  When I run command "projectile-trailblazer-find-view" selecting "user/view/index"
  Then I am in file "app/concepts/user/view/index.slim"
