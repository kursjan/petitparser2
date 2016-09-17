utility
selectEvenly: n fromFiles: collection
	^ self selectEvenly: n fromFiles: collection thatSatisfy: [ :e | true ]