;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;; The comment above is parsed by emacs so it knows what syntax to use

;;; This is a macro parsed by ASDF to assure a minimum version
#-asdf3.1 (error "hello-world requires ASDF 3.1 or higher")

;;; A system is what lisp calls <put good one-liner here>
(defsystem :hello-world
    ;;; The important stuff
    :description "Try to take over the world!"
    :version "0.0.3"
    :author "Jim Niemira <urmane@urmane.org>"
    :licence "Public Domain"

    ;;; I don't know what this means:
    :serial t

    ;;; I don't know what this means, either:
    :class :package-inferred-system

    ;;; This is a fake dependency so we can see how it works in this template
    :depends-on (:cl-json)

    ;;; Where the source code is
    :pathname "src"

    ;;; What source code files to load
    :components ((:file "main"))

;;; Add additional dependencies and components like this:
;;;	:depends-on (:lib-one
;;;		     :lib-two)
;;;	:components ((:module "module-1"
;;;				:components
;;;				((:file "mod1-file1")))
;;;		     (:module "module-2"
;;;                              :components
;;;                              ((:file "mod2-file1")
;;;                               (:file "mod2-file2")))
;;;		     (:file "main")))

    ;;; For qtools:
    ;;; :build-operation "qt-program-op"
    ;;; For asdf (I can't seem to make this work ...)
    ;;; :build-operation "asdf:program-op"
    ;;; For deploy
;    :defsystem-depends-on (:deploy)
;    :build-operation "deploy-op"
;    :build-pathname "hello-world"
;    :entry-point "hello-world:main"
)
