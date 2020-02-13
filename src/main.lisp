;;; This says the rest of this file is in the cl-user namespace
;;; ... until another in-package definition
;;; This is the traditional space used by the user code, and is
;;; a nickname for :common-lisp-user
(in-package :cl-user)

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

;;; Ok, really, the rest of this file is in our new namespace
(in-package :hello-world)


;;; Global (in-package) variables
(defvar *log-file* nil)
;;; Common mistake - don't do this, as it won't work for standalone executables
;;; as it would be eval'd at compile-time and be invalid at run-time
;;; (defvar *log-file* (open-log-file))
;;; Similarly for threads, sockets, database connections, including those
;;; opened by libraries


;;; OS differences
;;; #+windows
;;; (defun os-dependent-calculation()
;;;   (the-windows-way))
;;; #+linux
;;; (defun os-dependent-calculation()
;;;   (the-linux-way))
;;; #+osx
;;; (defun os-dependent-calculation()
;;;   (the-apple-way))
;;; #-(or windows linux osx)
;;; (error "Function ’os-dependent-calculation’ is not
;;;        yet implemented on this operating system.")
;;; (defun main()
;;;   (use-calculated-value (os-dependent-calculation)))
;;;
;;; Compiler differences
;;; #+sbcl
;;; (defun compiler-dependent-calculation()
;;;   (the-sbcl-way))
;;; #+ccl
;;;(defun compiler-dependent-calculation()
;;;  (the-ccl-way))
;;;#-(or sbcl ccl)
;;;(error "Function ’compiler-dependent-calculation’ is
;;;        not yet implemented on this compiler.")
;;;(defun main()
;;;  (use-calculated-value
;;;   (compiler-dependent-calculation)))


;;; Application code

(defun normal-path ()
  (format t "Hello.
Use a parameter to trigger an error.
Qlot loaded cl-json from ~%~A.~%"
    (asdf:system-source-directory (asdf:find-system :cl-json))))

(defun error-path ()
  "In Slime errors get caught by the debugger.  In an executable they're handled with (exit-with-backtrace)."
  (error "Unhandled error print backtraces and exit."))


;;; Open files, threads, sockets, dbs, anything external in a function called at runtime
(defun app-initialize ()
  "Application initialization."
;;;  (setf *log-file* (open-log-file))
)

(defun app-finalize ()
    "Application shutdown."
    ;;;  (close-log-file *log-file*)
    (setf *log-file* nil))


;;; Run from SLIME here, not (main) (or main())
(defun app-run (argv)
    "Application logic.  Separate from (main) to allow running from Slime."
    (app-initialize)
    (if (< (length argv) 2)
      (normal-path)
      (error-path)))
    (app-finalize)

;;; Functions for building executables.
(defun exit-with-backtrace (c)
    "Print backtrace and exit, don't land in debugger."
    (uiop:print-condition-backtrace c :count 15)
    (uiop:quit 1))

(defun main (argv)
    "Entry point for standalone executable."
    ;;; The main() function traditionally handles an app's start and stop functionality
    ;;; like handling args, calling _start, etc.
    ;;; See, eg:
    ;;; https://www.muppetlabs.com/~breadbox/software/tiny/teensy.html
    ;;; It lines up with standard C library functionality
    ;;; But lisp environments don't need that, so we split the app code out separately
    ;;; That way we can build for using via a REPL or via a standalone process

    ;;; This says it's not an error if there is no argv
    (declare (ignorable argv))

    ;;; This creates an error handler that catches any errors thrown by our app code
    ;;; If you run the app code from a REPL, you'll get to a debugger instead
    (handler-bind ((error #'exit-with-backtrace))

        ;;; Run the app code, pass in args
        (app-run argv)

        ;;; OS-independent exit function, just exit code zero here
        (uiop:quit 0)))

