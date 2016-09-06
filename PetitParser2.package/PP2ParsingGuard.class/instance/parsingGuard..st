conversion
parsingGuard: anArray
	self assert: classification = (anArray copyFrom: 1 to: classification size).
	^ self