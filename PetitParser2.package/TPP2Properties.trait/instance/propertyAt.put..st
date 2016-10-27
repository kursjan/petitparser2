accessing - properties
propertyAt: aKey put: anObject
	"Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject."

	^ (self properties ifNil: [ self properties: (IdentityDictionary new: 1) ])
		at: aKey put: anObject