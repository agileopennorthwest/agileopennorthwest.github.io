grab-attendees:
	bin/grab.rb

generate-css:
	lessc less/aonw.less > css/aonw.css
	lessc -x less/aonw.less > css/aonw.min.css

serve: generate-css
	jekyll serve --watch
	# python -m SimpleHTTPServer