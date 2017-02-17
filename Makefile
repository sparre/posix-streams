all: build

build: fix-whitespace
	gprbuild -p -P vcs_status
	gprbuild -p -P posix_streams

test: build
	@./tests/build
	@./tests/run

install: build test
	@echo "Not installing anything at this time."
	@false

clean:
	rm -rf generated
	rm -rf obj
	find * -name "*~"    -type f -print0 | xargs -0 -r /bin/rm
	find * -name "*.ali" -type f -print0 | xargs -0 -r /bin/rm
	find * -name "*.o"   -type f -print0 | xargs -0 -r /bin/rm

distclean: clean
	gprclean -P vcs_status    || true
	gprclean -P posix_streams || true
	rm -rf bin

fix-whitespace:
	@find src tests -name '*.ad?' | xargs --no-run-if-empty egrep -l '	| $$' | grep -v '^b[~]' | xargs --no-run-if-empty perl -i -lpe 's|	|        |g; s| +$$||g'

