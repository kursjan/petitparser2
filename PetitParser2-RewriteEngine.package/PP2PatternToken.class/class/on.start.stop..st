instance creation
on: collection start: start stop: stop
	^ self new
		collection: collection;
		start: start;
		stop: stop;
		yourself