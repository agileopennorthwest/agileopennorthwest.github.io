grab-attendees:
	bin/grab.rb

generate-css:
	lessc less/aonw.less > css/aonw.css
	lessc -x less/aonw.less > css/aonw.min.css

watch:
	fswatch -o less/* | xargs -n1 -I{} make generate-css

serve: generate-css
	jekyll serve --watch
	# python -m SimpleHTTPServer