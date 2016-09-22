accessing - properties
hasProperty: aKey
	"Test if the property aKey is present."
	
	^ self properties notNil and: [ self properties includesKey: aKey ]