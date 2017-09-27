all: test

integration-test:
	cask exec ecukes --quiet

test: integration-test

.PHONY: test
