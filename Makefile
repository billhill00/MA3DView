##########################################################################
# Project:      Mouse Atlas						#
# Title:        Makefile		                               	#
#$Id$
# Date:         September 1994	                                    	#
# Author:       Bill Hill 				    		#
#$Revision$
# Purpose:      Template makefile for Mouse Atlas Project sources.	#
# Maintenance:	Log changes below, with most recent at top of list.	#
# Christophe : 15 Sep 94 : added doc and www templates                  #
#########################################################################

# Include the configuration makefile (modify as required).
include			../../Makefile.conf

# local mods to Makefile.conf defaults
OPENGLHOME		= /opt/Mesa
OPENGL_INC_DIR          = $(OPENGLHOME)/include
OPENGL_LIB_DIR		= $(OPENGLHOME)/lib
ifeq ($(UNIXTYPE), IRIX5)
OPENGL_LIB_DIR		= $(OPENGLHOME)/lib.32
endif
ifeq ($(UNIXTYPE), IRIX6)
OPENGL_LIB_DIR		= $(OPENGLHOME)/lib.n32
endif
ifeq ($(UNIXTYPE), IRIX646)
OPENGL_LIB_DIR		= $(OPENGLHOME)/lib64
endif

# Names of executables to be built (modify as required).
EXECUTABLES		= MA3DView

# A version number for a versioned release
RELEASE			= 1.0

# List of all 'C' source files (modify as required).
CSOURCES		= \
			MAColormapUtils.c \
			domain_menu.c \
			file_menu.c \
			image_menu.c \
			main_buttonbar.c \
			main_menubar.c \
			main_work_area.c \
			MA3DView.c \
			MA3DViewCropImage.c \
			MA3DViewUtils.c \
			MAOpenGLUtils.c \
			MAFilterImage.c

# List of all header files that are available outside of either this archive
# or these executables (modify as required).
INCLUDES_PUB		= 

# List of all header files that are required by this archive or these
# executables (modify as required).
INCLUDES_PRV		= \
			MA3DView.h \
			MA3DViewTypes.h \
			MA3DViewProto.h \
			MA3DViewHelp.h

# List of all troff sources for manual pages, these should have the appropriate
# extension (eg cat.1) (modify as required).
MANPAGES		=

# List of all files of the documentation (Usually .tex .ps )
# (modify as required).
DOC_FILES		=

# List of all html directories for interactive help
# (modify as required).
WWW_DIRS		=

# List of all header file directories to be searched (modify as required).
# add TEMPLATE_DIRS to it if C++
INCDIRS			= .  \
			../../Core/libAlc \
			../../Core/libbibfile \
			../../Core/libAlg \
			../../Core/libWlz \
			../../Core/libWlzExtFF \
			../../Core/libReconstruct \
			../../Core/libhguDlpList \
			../../HGUX/libHguX \
			../../HGUX/libHguXm \
			../../HGUX/libhguGL \
			  $(HGU_INC_DIR) \
			  $(OPENGL_INC_DIR) \
			  $(X11_INC_DIR) \
			  $(MOTIF_INC_DIR) \
			/opt/local/include

# List of library search paths (modify as required).
ifeq ($(UNIXTYPE), IRIX5)
LIBDIRS			= \
			../../Core/libAlc \
			../../Core/libbibfile \
			../../Core/libAlg \
			../../Core/libWlz \
			../../Core/libWlzExtFF \
			../../Core/libReconstruct \
			../../Core/libhguDlpList \
			../../HGUX/libHguX \
			../../HGUX/libHguXm \
			../../HGUX/libhguGL \
			$(OPENGL_LIB_DIR) \
			$(SYSLIB) \
			$(HGU_LIB_DIR) \
			/opt/local/lib
else
LIBDIRS			= \
			$(SYSLIB) \
			../../Core/libAlc \
			../../Core/libbibfile \
			../../Core/libAlg \
			../../Core/libWlz \
			../../Core/libWlzExtFF \
			../../Core/libReconstruct \
			../../Core/libhguDlpList \
			../../HGUX/libHguX \
			../../HGUX/libHguXm \
			../../HGUX/libhguGL \
			$(HGU_LIB_DIR) \
			$(OPENGL_LIB_DIR) \
			$(X11_LIB_DIR) \
			$(MOTIF_LIB_DIR) \
			/opt/local/lib
endif
ifeq ($(UNIXTYPE), IRIX646)
LIBDIRS			= \
			../../Core/libAlc \
			../../Core/libbibfile \
			../../Core/libAlg \
			../../Core/libWlz \
			../../Core/libWlzExtFF \
			../../Core/libReconstruct \
			../../Core/libhguDlpList \
			../../HGUX/libHguX \
			../../HGUX/libHguXm \
			../../HGUX/libhguGL \
			$(OPENGL_LIB_DIR) \
			$(SYSLIB) \
			$(HGU_LIB_DIR) \
			/opt/local/lib
endif
ifeq ($(UNIXTYPE), IRIX6)
LIBDIRS			= \
			../../Core/libAlc \
			../../Core/libbibfile \
			../../Core/libAlg \
			../../Core/libWlz \
			../../Core/libWlzExtFF \
			../../Core/libReconstruct \
			../../Core/libhguDlpList \
			../../HGUX/libHguX \
			../../HGUX/libHguXm \
			../../HGUX/libhguGL \
			$(OPENGL_LIB_DIR) \
			$(SYSLIB) \
			$(HGU_LIB_DIR) \
			/opt/local/lib
endif

# List of all sub directories that contain makefiles. The subsystems will be
# built in the order in which they are given here (modify as required).
SUBSYSTEMS		= 

# Name of distribution tar file (modify as required).

# List of files (should be top level directories) to be put used in creating
# a compressed tar file for distribution (modify as required).
TARSOURCES		= 

# List of all header files, ie the union of the private and public header
# files (should not need modifying).
INCLUDES_ALL		= $(sort $(INCLUDES_PUB) $(INCLUDES_PRV))

# List of all object files required for archive (should not need modifying).
# C++ edit the next line
OBJECTS			= $(CSOURCES:%.c=%.o)

# List of libraries to link (modify as required).
ifeq 		($(UNIXTYPE), SUNOS5)
EXTRA_LIBS		= tiff m gen socket nsl
X11LIBS         	= Xt Xmu X11  Xi Xext
else
EXTRA_LIBS		= tiff m gen
X11LIBS         	= Xt Xmu X11 Xext
endif

OPENGLLIBS		= GLU GL
MOTIFLIBS       	= Xm
LOCALLIBS		= hguGL HguXm HguX WlzExtFF Wlz Reconstruct hguDlpList bibfile Alg Alc
LIBRARIES		= hguGL HguXm HguX Wlz Reconstruct hguDlpList bibfile Alg Alc \
			$(OPENGLLIBS) $(MOTIFLIBS) $(X11LIBS) $(EXTRA_LIBS)

# Basic flags for controlling compilation (modify as required).
#CDEBUG			= -g
#COPTIMISE		=

DEFINES			= -D$(UNIXTYPE) $(UNIXFLAGS) -D__EXTENSIONS__
CPPFLAGS		= $(INCDIRS:%=-I%) $(DEFINES)
CFLAGS			= $(CDEBUG) $(COPTIMISE) $(ANSI_CONFORMANCE)

ifeq 		($(UNIXTYPE), SUNOS5)
#CDEBUG			= -g
#COPTIMISE		= -xcg92
endif
LDFLAGS			= $(LIBDIRS:%=-L%)
ifeq 		($(UNIXTYPE), SUNOS5)
LDFLAGS			= $(LIBDIRS:%=-L%) -R$(SYSLIB):$(HGU_LIB_DIR):$(OPENGL_LIB_DIR):$(X11_LIB_DIR):$(MOTIF_LIB_DIR)
endif
LDLIBS			= $(LOCALLIBS:%=-l%) $(OPENGLLIBS:%=-l%) \
			$(MOTIFLIBS:%=-l%) \
			$(X11LIBS:%=-l%) $(EXTRA_LIBS:%=-l%)

# Default traget which builds everything (should not need modifying).
all:			archive executables includes manpages 
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif

# this fakes a link using the library. CommonTypes.cc defines the templates
# to be instanciated. Then the instanciations found in ptrepository are
# collected and added to the library.
sun-instanciate-templates : 
		@echo "Now instanciating the templates for Sun CC v3"
		$(CXX) -c -o CommonTypes.o $(CPPFLAGS) $(CXXFLAGS) CommonTypes.cc
		-$(CXX) -pta -o dummy $(LIBDIRS:%=-L%) $(CPPFLAGS) \
$(CXXFLAGS) CommonTypes.o ./$(ARCHIVE) $(REQUIRED_LIBS)
		$(RM) dummy CommonTypes.o
		$(AR) rv  ./$(ARCHIVE) ptrepository/*.o
		@echo "Instanciation finished"
		true

# Target which installs everything after it has been built (should not need
# modifying).
install:		install_includes install_manpages install_archive \
			install_executables install_www install_doc

# Target which installs an archive (should not need modifying).
install_archive:	$(ARCHIVE)
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
			$(install_archive)

# Target which installs executables (should not need modifying).
install_executables:	$(EXECUTABLES)
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
			$(install_executables)

# Target which installs the public 'C' header files (should not need 
# modifying).
install_includes:	$(INCLUDES_PUB)
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
			$(install_includes)

# Target which installs the www files (should not need modifying)
install_www:		$(WWW_DIRS)
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
ifneq ($(strip $(WWW_DIRS)),)
			$(install_www)
endif

# Target which installs the doc files (should not need modifying)
# modifying).
install_doc:	$(DOC_FILES)
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
			$(install_doc)

# Target which installs the manual pages in the appropriate directories,
# watch out for the tabs in the sed regexp's (should not need modifying).
install_manpages:	$(MANPAGES)
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
			$(install_manpages)

# Target for compressed tar files suitable for distribution (should not need
# modifying).
tar:			$(TARSOURCES) clobber allsources
ifneq ($(strip $(TARSOURCES)),)
			$(TAR) $(TARFLAGS) $(TARFILE) $(TARSOURCES)
			$(COMPRESS) $(TARFILE)
endif

# Target for the archive (library), just a dependency (should not need
# modifying).
archive:		$(ARCHIVE)

# Target for executables, just a dependency (should not need modifying).
executables:		$(EXECUTABLES)

# Target for public header files, just a dependency (should not need modifying).
includes:		$(INCLUDES_PUB)

# Target for manual pages, just a dependency (should not need modifying).
manpages:		$(MANPAGES)

# Target for lint (modify as required).
lint:			$(CSOURCES) $(INCLUDES_PRV)
			$(LINT) $(LINTFLAGS) $(CPPFLAGS) $(CSOURCES)

# Target to clean up after making (should not need modifying).
clean:
			-$(RM) core $(OBJECTS) $(EXECUTABLES) $(ARCHIVE)

# Target to clean up everything that might not be wanted (should not need
# modifying).
clobber:		clean
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif
			-$(RM) *.o *.a .pure *.pure *.bak *~

# making the tag file
tags:
	$(ETAGS) -f $(ETAGSFILE) $(ETAGSFLAGS) $(CSOURCES) $(CCSOURCES) $(INCLUDES_ALL)

# Target to create editable sources from SCCS (should not need modifying).
edit:
			$(SCCS) edit $(CSOURCES) $(INCLUDES_ALL) Makefile

# Target to create read only sources from SCCS (should not need modifying).
sources:
			-$(SCCS) get $(CSOURCES) $(INCLUDES_ALL) Makefile

allsources:		sources
ifneq ($(strip $(SUBSYSTEMS)),)
			$(subsystems)
endif

# Targets to create archives, dependencies and rules (modify as required).
# C++ uncommment the (INSTANCIATE_TEMPLATES) macro

ifneq ($(strip $(ARCHIVE)),)
$(ARCHIVE):		$(OBJECTS)
			$(AR) r $(ARCHIVE) $?
#			-$(INSTANCIATE_TEMPLATES)
			$(RANLIB) $(ARCHIVE)
endif


# Rules for linking (modify as required).
# C++ version for OSCC programs (modify as required)
#compiling the schema (should not need modifying)
#schema_standin: 	schema.cc
#			OSCC $(CPPFLAGS) $(CXXFLAGS) \
#        	           -batch_schema $(OS_COMPILATION_SCHEMA_DB_PATH) schema.cc
#			touch schema_standin

#compilation rule for Object Store programs
#progname:		$(OBJECTS) schema_standin
#			$(OS_PRELINK) .os_schema.cc\
#		        $(OS_COMPILATION_SCHEMA_DB_PATH) \
#        		$(OS_APPLICATION_SCHEMA_DB_PATH) \
#			$(OBJECTS) $(CXXLIBS)
#			OSCC -c .os_schema.cc
#			$(CXX) -o $@ $(OBJECTS) .os_schema.o $(CXXFLAGS) $(LDFLAGS) $(CXXLIBS)
#			$(OS_POSTLINK) $@

$(OBJECTS):		%.o: %.c $(INCLUDES_PRV)
ifeq ($(UNIXTYPE), SUNOS5)
			$(CC) -v  -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
else
			$(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
endif

# Targets to create executables, just a dependencies (modify as required).
MA3DView.o:		MA3DView.c MA3DViewResources.h $(INCLUDES_ALL)
MA3DView:		$(OBJECTS)

# Target for Purified executables (modify as required).
purify:			MA3DView.pure
MA3DView.pure:		$(OBJECTS)