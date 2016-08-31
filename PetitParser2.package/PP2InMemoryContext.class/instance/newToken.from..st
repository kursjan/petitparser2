tokenization
newToken: tokenClass from: start
	^ tokenClass 
		on: collection
		start: start + 1
		stop: position