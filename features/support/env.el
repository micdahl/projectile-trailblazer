(require 'f)

(defvar projectile-trailblazer-support-path
  (f-dirname load-file-name))

(defvar projectile-trailblazer-features-path
  (f-parent projectile-trailblazer-support-path))

(defvar projectile-trailblazer-root-path
  (f-parent projectile-trailblazer-features-path))

(add-to-list 'load-path projectile-trailblazer-root-path)

(defvar projectile-trailblazer-test-app-path
  (f-canonical (concat (make-temp-file "projectile-trailblazer-test" t) "/")))

(defun projectile-trailblazer-test-touch-file (filepath)
  (let ((fullpath (expand-file-name filepath projectile-trailblazer-test-app-path)))
    (unless (file-exists-p fullpath)
      (if (s-ends-with? "/" fullpath)
          (make-directory fullpath)
        (f-touch fullpath)))))

(defun delete-fixture-files ()
  (let* ((files '("spec/fixtures/" "spec/factories/" "spec/fabricators/"
                  "test/fixtures/" "test/factories/" "test/fabricators/"))
         (fullpath (--map (f-expand it projectile-trailblazer-test-app-path) files))
         (file-in-directory (first (--filter (f-exists? it) fullpath))))
    (when file-in-directory
      (f-delete file-in-directory t))))

(require 'projectile-rails)
(require 'projectile-trailblazer)
(require 'espuds)
(require 'ert)

(Setup
 (make-temp-file projectile-trailblazer-test-app-path t)
 (loop for path in `("app/"
                     "app/assets/"
                     "app/assets/javascripts/"
                     "app/assets/stylesheets/"
                     "app/models/"
                     "app/models/admin/"
                     "app/models/concerns/"
                     "app/concepts/"
                     "app/concepts/user/"
                     "app/concepts/user/cell/"
                     "app/concepts/user/contract/"
                     "app/concepts/user/operation/"
                     "app/concepts/user/view/"
                     "app/controllers/"
                     "app/controllers/admin/"
                     "app/controllers/concerns/"
                     "app/helpers/"
                     "app/views/"
                     "app/views/users/"
                     "app/views/admin/"
                     "app/views/admin/users/"
                     "app/views/layouts/"
                     "app/views/application/"
                     "app/javascript/"
                     "app/javascript/packs/"
                     "app/jobs/"
                     "app/jobs/admin/"
                     "app/mailers/"
                     "config/"
                     "config/environments/"
                     "config/initializers/"
                     "config/locales/"
                     "config/webpack/"
                     "config/webpack/configuration.js"
                     "db/"
                     "db/migrate/"
                     "lib/"
                     "lib/admin/"
                     "lib/assets/"
                     "lib/assets/javascripts/"
                     "lib/assets/stylesheets/"
                     "public/"
                     "public/javascripts/"
                     "log/"
                     "spec/"
                     "spec/lib/"
                     "spec/models/"
                     "spec/controllers/"
                     "spec/controllers/admin/"
                     "test/"
                     "test/controllers/"
                     "features/"
                     "tmp/"
                     "vendor/"
                     "vendor/engine/"
                     "package.json"
                     "Gemfile"
                     "Rakefile"
                     "config/routes.rb"
                     ,(concat temporary-file-directory "spring/"))
       do (projectile-trailblazer-test-touch-file path))

 (require 'yasnippet)
 (require 'bundler)
 (require 'projectile-rails)
 (require 'projectile-trailblazer)

 (setq kill-buffer-query-functions nil
       projectile-completion-system 'default
       projectile-indexing-method 'native
       projectile-rails-expand-snippet nil)
 (yas-global-mode)

 (cd projectile-trailblazer-test-app-path))

(After
 (yas-exit-all-snippets)
 (--each (buffer-list)
   (with-current-buffer it
     (when projectile-trailblazer-mode
       (kill-buffer)))))

(Teardown
 (delete-directory projectile-trailblazer-test-app-path t))

(After "@finding-fixtures"
       (delete-fixture-files))

(provide 'env)
;;; env ends here
