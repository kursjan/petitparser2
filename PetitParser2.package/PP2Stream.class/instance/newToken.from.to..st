tokenization
newToken: tokenClass from: start to: stop
	^ tokenClass 
		on: collection 
		start:  start
		stop: 	stop