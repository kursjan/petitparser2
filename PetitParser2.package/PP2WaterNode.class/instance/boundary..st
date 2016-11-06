accessing
boundary: anObject
	boundary := anObject.
	self halt: 'should not really be used'.
	self isDebugging ifTrue: [ boundary enableDebug ].
