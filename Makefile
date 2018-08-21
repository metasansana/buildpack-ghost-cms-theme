

.PHONY: test
test:
	docker run --rm -it \
	-v $(shell pwd)/test/fixtures/:/fixtures:ro \
	-v $(shell pwd):/ghost:ro \
	gliderlabs/herokuish bash -c \
	'/bin/herokuish buildpack install file:///ghost && \
	cd /ghost; test/run'

