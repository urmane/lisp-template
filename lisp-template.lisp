;;; Set package (and, optionally, readtable) for this file
(in-package :lisp-template)

;;; I'm currently using start here, and main in the roswell script
(defun start (&rest argv)
  (declare (ignorable argv))
  (format *standard-output* "Put my code here~%")
)
