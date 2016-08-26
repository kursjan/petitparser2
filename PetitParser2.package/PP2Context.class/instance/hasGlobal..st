accessing-globals
hasGlobal: aKey
	"Test if the global property aKey is present."
	
	^ globals notNil and: [ globals includesKey: aKey ]