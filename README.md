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


Compiling
Just run
make


Compiling a binary with buildapp
Currently done automatically with "make", or run "make build_with_buildapp"
Prerequisites
For buildapp, the following must be in path:
- sbcl --version
- buildapp
- make -v


Compiling a binary with roswell
Currently broken; see for yourself with "make build_with_roswell"


Executing a binary
Resulting binaries are in builds/


Executing directly with lisp interpreter
sbcl --quit --load hello-world.lisp


Executing with Roswell
Note that roswell runs the source just fine, no binary needed; just
run the roswell version of the script directly
ros roswell/hello-world.ros
or
./roswell/hello-world.ros
