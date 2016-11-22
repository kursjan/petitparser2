accessing - globals
globalAt: aKey
	"Answer the global property value associated with aKey."
	
	^ self globalAt: aKey ifAbsent: [ self error: 'Property not found' ]