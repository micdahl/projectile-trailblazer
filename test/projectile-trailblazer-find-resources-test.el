(expectations
 (desc "projectile-rails-choices"
       (expect '("admin/cell/edit" "user/cell/new")
               (with-mock
                (stub projectile-rails-dir-files => '("/path/app/concepts/user/cell/new.rb"
                                                      "/path/app/concepts/user/contract/create.rb"
                                                      "/path/app/concepts/admin/cell/edit.rb")
                      )
                (projectile-rails-hash-keys
                 (projectile-rails-choices '(("/path/app/concepts/" "/app/concepts/\\(.+/cell/.+\\)\\.rb$")))
                 )
                )
               )
       (expect '("user/contract/create")
               (with-mock
                (stub projectile-rails-dir-files => '("/path/app/concepts/user/cell/new.rb"
                                                      "/path/app/concepts/user/contract/create.rb"
                                                      "/path/app/concepts/admin/cell/edit.rb")
                      )
                (projectile-rails-hash-keys
                 (projectile-rails-choices '(("/path/app/concepts/" "/app/concepts/\\(.+/contract/.+\\)\\.rb$")))
                 )
                )
               )
       (expect '("user/operation/create")
               (with-mock
                (stub projectile-rails-dir-files => '("/path/app/concepts/user/operation/create.rb"
                                                      "/path/app/concepts/user/contract/create.rb"
                                                      "/path/app/concepts/admin/cell/edit.rb")
                      )
                (projectile-rails-hash-keys
                 (projectile-rails-choices '(("/path/app/concepts/" "/app/concepts/\\(.+/operation/.+\\)\\.rb$")))
                 )
                )
               )
       )
 )
(provide 'projectile-trailblazer-find-resources-test)
;;; projectile-trailblazer-find-resources-test.el ends here
