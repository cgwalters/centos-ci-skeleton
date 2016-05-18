CLEANFILES = 

TEMPLATES = jjb/cciskel-duffy.yml
CLEANFILES += $(TEMPLATES)

jjb/%.yml: jjb-tmpl/%.yml Makefile
	test -n "$(CENTOSCIPROJECTNAME)" && test -n "$(CENTOSCINODE)"
	sed -e s,@CENTOSCIPROJECTNAME@,$(CENTOSCIPROJECTNAME), \
	    -e s,@CENTOSCINODE@,$(CENTOSCINODE), \
            -e "s,@GENERATED_WARNING@,WARNING: This file is auto-generated from $<; DO NOT EDIT!," \
	    < $< > $@.tmp && mv $@.tmp $@

all: $(TEMPLATES)

clean:
	rm -f $(CLEANFILES)
