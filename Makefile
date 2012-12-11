# push site to server
push:
	rsync --recursive --verbose --delete site/* timme:~/fred-site

# update ember.js and ember-data
# Do not use any more; build from source (see `ember` and `ember-data`)
#update:
#	curl http://cloud.github.com/downloads/emberjs/ember.js/ember-latest.js > site/vendor/scripts/ember-latest.js
#	curl http://cloud.github.com/downloads/emberjs/data/ember-data-latest.js > site/vendor/scripts/ember-data-latest.js

# Build ember from source
ember:
	rvm use 1.9.2
	cd site/ember.js/
	bundle
	bundle exec rake
	cp dist/ember.js ../vendor/scripts/ember-latest.js

# Build ember-data from source
ember-data:
	rvm use 1.9.2
	cd site/ember-data/
	bundle
	bundle exec rake
	cp dist/ember-data.js ../vendor/scripts/ember-data-latest.js
