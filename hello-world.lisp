;;; CLI runner
;;; Run this like this:
;;; sbcl --quit --load hello-world.lisp

(in-package :cl-user)
;; Configure ASDF to find the project systems
(load "src/prep-quicklisp.lisp")
;; Load the server
(ql:quickload :qlot)
(qlot:quickload :hello-world)
;; Go
(hello-world:main ())
