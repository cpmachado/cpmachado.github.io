.PHONY: all serve install

all: serve


clean:
	bundle exec jekyll clean

install:
	bundle install

serve:
	bundle exec jekyll serve --incremental -o -l

