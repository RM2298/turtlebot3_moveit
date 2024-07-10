
(cl:in-package :asdf)

(defsystem "beginner_tutorials-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "my_message" :depends-on ("_package_my_message"))
    (:file "_package_my_message" :depends-on ("_package"))
  ))