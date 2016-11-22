accessing - globals
hasGlobal: aKey
	"Test if the global property aKey is present."
	
	^ self globals notNil and: [ self globals includesKey: aKey ]