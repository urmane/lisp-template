;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
#-asdf3.1 (error "lisp-template requires ASDF 3.1")

;;; ASDF needs to be able to find this, so I put this all in
;;; ~/common-lisp/name where name is the same as the defsystem name
;;; If ASDF cannot find it, ./build won't work
(defsystem lisp-template
    :description "Put description here"
    :version "0.0.1"
    :author "My Name <name@company.tld>"
    :license "Fixme"
    :class :package-inferred-system ; what is this for?
    :depends-on () ; list dependencies

    ;;; Use ":serial t" if dependencies are serial
    :serial t
    ;;; For more granularity, use instead:
    ;;; :components ((:file "name" :depends-on ("name2" "name3")) (...) )

    ;;; List all the lisp files
    :components ((:file "lisp-template-package")
                 (:file "lisp-template"))

    ;;; For qtools build method: doesn't work
    ;;;:build-operation "qt-program-op"
    ;;; For asdf build method: doesn't work
    ;;;:build-operation "asdf:program-op"
    ;;; For deploy: works
    :defsystem-depends-on (:deploy) ; use this if using deploy to create standalone executables
    :build-operation "deploy-op"
    :build-pathname "lisp-template" ; it will actually be in bin/<name>
    :entry-point "lisp-template:start" ; I use start here, and main in .ros files
)

