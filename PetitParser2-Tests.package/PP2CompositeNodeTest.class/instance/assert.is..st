utilities
assert: aCollection is: anObject
	self parse: aCollection.
	self
		assert: result = anObject
		description: 'Got: ' , result printString , '; Expected: ' , anObject printString
		resumable: true