utility
selectEvenly: n from: collection
	^ self selectEvenly: n from: collection thatSatisfy: [ :e | true ]