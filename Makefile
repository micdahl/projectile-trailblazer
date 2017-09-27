all: test

integration-test:
	cask exec ecukes --quiet

unit-test:
	cask exec ./test/run-tests

test: unit-test integration-test

.PHONY: test
