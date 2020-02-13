;;; This is a standard file that other app source lisp files can include
;;; It centralizes the package definitions visible to external users
;;; Think of it as a .h file in C, if that helps
;;; :cl-user is a nickname for :common-lisp-user - use them interchangeably
(in-package :common-lisp-user)

;;; Define our own package
(defpackage :hello-world

    ;;; This says what namespaces (besides the current one)
    ;;; to use for symbol names without a package
    ;;; :cl is a nickname for :common-lisp, and has all the language default stuff
    (:use :cl)

    ;;; An example of something you might have here
    ;;; The usage of other packages to expose their symbols to our code
    ;;; (:use #:cl+qt)

    ;;; This is the list of symbols to export for other packages to use
    (:export :app-run :main))
