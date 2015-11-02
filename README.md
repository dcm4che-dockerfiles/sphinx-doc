# sphinx-doc - Docker image

This is a simple little Docker image intended to allow reasonably easy
generation of documentation using the Sphinx Documentation tool without having
to install the whole Latex bundle on your host machine.

This is certainly a trivial way of using Docker, but there you go.

## Usage

I've been using it like this.

Create a Dockerfile with the following contents:

```dockerfile
FROM umbrellium:sphinx-doc
MAINTAINER Sam Mulube <sam@umbrellium.co.uk>

CMD ["/bin/bash"]

WORKDIR /doc
```

Then I've been using it with the following Makefile:

```makefile
# Makefile to generate documentation output
#
# Targets:
# 	quickstart
# 	html
# 	pdf
# 	clean

BUILDDIR = docs
VOLUMEDIR = /doc
VOLUME = $(shell pwd)/$(BUILDDIR):$(VOLUMEDIR)
IMAGE = umbrellium/sphinx-doc

.PHONY: html pdf deploy quickstart clean

builddir:
	mkdir -p $(BUILDDIR)

quickstart: builddir
	docker run --rm -i -t -v $(VOLUME) $(IMAGE) sphinx-quickstart

html: builddir
	docker run --rm -v $(VOLUME) $(IMAGE) make html

pdf: builddir
	docker run --rm -v $(VOLUME) $(IMAGE) make latexpdf

clean: builddir
	docker run --rm -v $(VOLUME) $(IMAGE) make clean
```
