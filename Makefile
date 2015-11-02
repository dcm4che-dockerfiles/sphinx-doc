# Makefile to generate our output
#
# Author: Sam Mulube <sam@umbrellium.co.uk>
#
# Targets:
# 	quickstart
# 	html
# 	latexpdf
# 	deploy

.PHONY: html pdf deploy quickstart

quickstart:
	docker run --rm -v $(pwd)/content:/doc umbrellium/wearon sphinx-quickstart
