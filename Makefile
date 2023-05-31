.PHONY: all serve install

all: serve


install:
	bundle install

serve:
	bundle exec jekyll serve --incremental -o -l

