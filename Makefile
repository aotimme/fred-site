# push site to server
push:
	rsync --recursive --verbose --delete site/* timme:~/fred-site

# update ember.js and ember-data
update:
	curl http://cloud.github.com/downloads/emberjs/ember.js/ember-latest.js > site/vendor/scripts/ember-latest.js
	curl http://cloud.github.com/downloads/emberjs/data/ember-data-latest.js > site/vendor/scripts/ember-data-latest.js
