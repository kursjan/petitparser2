context interface
newToken: tokenClass from: start to: stop
	| collection |
	collection := self copyFrom: start to: stop.
	
	^ tokenClass 
		on: collection 
		start:  1
		stop: 	(stop - start + 1)