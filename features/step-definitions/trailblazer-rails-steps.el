(Given "\\(?:directory\\|file\\) \"\\(.*\\)\" exists"
       (lambda (filepath)
         (projectile-trailblazer-test-touch-file filepath)))

(When "^I open the app file \"\\(.+\\)\""
      (lambda (filename)
        (find-file (concat projectile-trailblazer-test-app-path "/" filename))))

(When "^I run command \"\\(.+\\)\" \\(?:selecting\\|inputting\\) \"\\(.+\\)\"$"
      (lambda (command argument)
        (When "I start an action chain")
        (When "I press \"M-x\"")
        (And (s-lex-format "I type \"${command}\""))
        (When "I press \"RET\"")
        (And (s-lex-format "I type \"${argument}\""))
        (And "I execute the action chain")))

(When "^I turn off projectile-trailblazer-mode"
      (lambda ()
        (projectile-trailblazer-off)))

(When "^I turn on projectile-trailblazer-mode"
      (lambda ()
        (projectile-trailblazer-on)))

(Then "^I am in file \"\\(.+\\)\""
      (lambda (filename)
        (should (string-match-p (s-lex-format "${filename}$") (buffer-file-name)))))

(Then "^key \"\\(.+\\)\" should be mapped to \"\\(.+\\)\"$"
      (lambda (key command)
        (should (equal (key-binding (kbd key)) (intern command)))))

(Then "^projectile-trailblazer should be turned on"
      (lambda ()
        (should projectile-trailblazer-mode)))

(Then "^projectile-trailblazer should not be turned on"
      (lambda () (should-not projectile-trailblazer-mode)))
