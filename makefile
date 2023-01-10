grab-attendees:
	bin/grab.rb

grab-and-push:
	git pull
	make grab-attendees
	git commit -a -m "attendee grab"
	git push

generate-css:
	lessc less/aonw.less > css/aonw.css
	lessc less/aonw.less --clean-css="--s1" > css/aonw.min.css

watch:
	fswatch -o less/* | xargs -n1 -I{} make generate-css

bundle:
	bundle install

serve: bundle generate-css
	jekyll serve --watch
	# python -m SimpleHTTPServer