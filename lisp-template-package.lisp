;;; Always put a package def at the top of each file
(in-package :common-lisp-user)

;;; If you use ":packageName" for package names, keyword-style, the reader
;;; will convert it to a proper uppercase PACKAGENAME for you
(defpackage :lisp-template
	(:use :cl) ; don't forget cl (alias for common-lisp) here
	(:export :start))
