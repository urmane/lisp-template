Common Lisp template framework

My ongoing attempts to learn and build several things:
- Organizing a lisp project intended to be distributed
- Ability to compile binaries for dist
- Ability to run from CLI via lisp interpreter
- Ability to run from CLI via Roswell

Recognition:
This is based almost completely on
"Common Lisp in the Wild - Deploying Common Lisp Applications" by Wimpie Nortje
I learned a lot from this, you may, too, go buy it:
https://www.darkchestnut.com/book-common-lisp-application-deployment/

Compiling:
Just run: make

Compiling a binary with buildapp:
Prerequisites:
For buildapp, the following must be in path:
- sbcl --version
- buildapp
- make -v
Currently done automatically with "make", or run "make build_with_buildapp"

Compiling a binary with roswell:
Currently broken; see for yourself with "make build_with_roswell"

Executing a binary:
Resulting binaries are in builds/

Executing directly with lisp interpreter:
sbcl --quit --load hello-world.lisp

Executing with Roswell:
Note that roswell runs it from source just fine, no binary needed; just
run the roswell version of the script directly:
ros roswell/hello-world.ros
or
./roswell/hello-world.ros


Directory structure:

lisp-template/          # Project root

# Not version controlled
builds/			# Build artifacts
quicklisp/		# Qlot managed Quicklisp
generated_dirs/		# Generated directories

# Version controlled
doc/			# Project documentation
assets/			# Asset files
src/			# Lisp source code
    qlfile		# Qlot declaration - created
    qlfile.lock		# Qlot specs - generated
    prep-quicklisp.lisp	# Quicklisp initialization
    main.lisp		# Application entry point
    module/		# Self-contained module
        file.lisp	# Module source files
test/			# Unit tests
    file.lisp		# Test cases
Makefile		# Makefile
hello-world.asd		# Project system definition
hello-world.lisp	# CLI runner for program
hello-world-test.asd	# Testing system definition
hello-world-test.lisp	# CLI runner for tests
(all other developer-created files)
