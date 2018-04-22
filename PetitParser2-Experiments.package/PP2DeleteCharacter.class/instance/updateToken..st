private - updates
updateToken: token
	(self changeBeforeRange: token start) ifTrue: [ 
		token start: token start - 1.
		token stop: token stop - 1.
		token collection: input
	]