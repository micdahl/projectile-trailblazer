(When "^I open the app file \"\\(.+\\)\""
      (lambda (filename)
        (find-file (concat projectile-trailblazer-test-app-path "/" filename))))

(When "^I turn off projectile-trailblazer-mode"
      (lambda ()
        (projectile-trailblazer-off)))

(When "^I turn on projectile-trailblazer-mode"
      (lambda ()
        (projectile-trailblazer-on)))

(Then "^projectile-trailblazer should be turned on"
      (lambda ()
        (should projectile-trailblazer-mode)))

(Then "^projectile-trailblazer should not be turned on"
      (lambda () (should-not projectile-trailblazer-mode)))
