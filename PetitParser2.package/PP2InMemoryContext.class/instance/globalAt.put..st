accessing-globals
globalAt: aKey put: anObject
	"Set the global property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (globals ifNil: [ globals := Dictionary new: 1 ])
		at: aKey put: anObject