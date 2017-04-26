VERSION=HEAD
NAME=dotfiles
SOURCE=./tmp/$(NAME).tar

archive:
	@echo Running git archive...
	git archive --prefix=$(NAME)-$(VERSION)/ -o $(SOURCE) $(VERSION) 2> /dev/null || (echo 'Warning: $(VERSION) does not exist.' && git archive --prefix=$(NAME)-$(VERSION)/ -o $(SOURCE) HEAD)
	@echo Running git archive submodules...
	p=`pwd` && (echo .; git submodule foreach) | while read entering path; do \
		temp="$${path%\'}"; \
		temp="$${temp#\'}"; \
		path=$$temp; \
		[ -z "$$path" ] && continue; \
		(cd $$path && git archive --prefix=$(NAME)-$(VERSION)/$$path/ HEAD > $$p/tmp/tmp.tar && tar --concatenate --file=$$p/$(SOURCE) $$p/tmp/tmp.tar && rm -f $$p/tmp/tmp.tar); \
	done
