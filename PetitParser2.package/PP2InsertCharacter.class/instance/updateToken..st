private - updates
updateToken: token
	token start > position ifTrue: [ 
		token start: token start + 1.
		token stop: token stop + 1.
		token collection: input
	]