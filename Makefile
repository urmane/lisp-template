# Binary name
TARGET = hello-world

# Quicklisp system to load
QL_SYSTEM = hello-world

# Applications
SHELL = /bin/sh
LISP = sbcl
BUILDAPP = buildapp
ROSWELLAPP = ros

# Locations
# Source files
SRCDIR = $(CURDIR)/src
# Build output
OUTDIR = $(CURDIR)/builds
# Manifest
MANIFEST = quicklisp-manifest.txt

# Flags for manifest build
MANIFEST_FLAGS =  --no-sysinit
MANIFEST_FLAGS += --no-userinit
MANIFEST_FLAGS += --load $(SRCDIR)/prep-quicklisp.lisp

###
# Original
#MANIFEST_FLAGS += --eval '(ql:quickload :$(QL_SYSTEM))'
#MANIFEST_FLAGS += --eval '(ql:write-asdf-manifest-file \#P"$(MANIFEST)" :if-exists :supersede :exclude-local-projects nil)'
#MANIFEST_FLAGS += --eval '(ql:write-asdf-manifest-file "$(MANIFEST)" :if-exists :supersede :exclude-local-projects nil)'
###
# Using qlot
# qlot allows us to depend on specific versions of libraries, including
# dependencies and crossing multiple Quicklisp dists.
# Not specifying a specific version for a library just loads it from default
MANIFEST_FLAGS += --eval '(ql:quickload :qlot)'
MANIFEST_FLAGS += --eval '(qlot:install :$(QL_SYSTEM))'
MANIFEST_FLAGS += --eval '(qlot:quickload :$(QL_SYSTEM))'
MANIFEST_FLAGS += --eval '(qlot:with-local-quicklisp (:$(QL_SYSTEM)) (ql:write-asdf-manifest-file \#P"$(MANIFEST)" :if-exists :supersede :exclude-local-projects nil))'
###
MANIFEST_FLAGS += --eval '(uiop:quit)'

# Having challenges with various build systems,
# either building or executing the resulting binary
# Currently there are settings here for: buildapp, deploy, asdf, and roswell

# ASDF build settings
# asdf system is the same as quicklisp system here ... right?
A_FLAGS = --eval '(asdf:make :$(QL_SYSTEM))'
A_FLAGS += --quit

# Buildapp settings
B_FLAGS =  --output $(OUTDIR)/$(TARGET)
B_FLAGS += --manifest-file $(MANIFEST)
B_FLAGS += --asdf-path $(CURDIR)/
B_FLAGS += --load-system $(QL_SYSTEM)
B_FLAGS += --entry $(QL_SYSTEM):main

# Roswell settings
# Hrm, this runs it, too ...
# but it does gen the output file
R_FLAGS = dump executable
R_FLAGS += $(CURDIR)/roswell/hello-world.ros
R_FLAGS += -o $(OUTDIR)/roswell/hello-world

#all: build_manifest build_with_buildapp build_with_roswell build_with_asdf
all: build_manifest build_with_buildapp

build_manifest:
	-mkdir -p $(OUTDIR)
	$(LISP) $(MANIFEST_FLAGS)

build_with_asdf:
	echo "Broken; since we use qlot ASDF dinna find our system, or dependencies"
	#$(LISP) $(A_FLAGS)

build_with_roswell:
	#echo "runs without error, but does not actually dump executable?"
	$(ROSWELLAPP) $(R_FLAGS)

# buildapp: http://www.xach.com/lisp/buildapp/
build_with_buildapp:
	$(BUILDAPP) $(B_FLAGS)

.PHONY: clean
clean:
	-rm $(OUTDIR)/*
	-rm $(MANIFEST) $(BUILDLOG)
