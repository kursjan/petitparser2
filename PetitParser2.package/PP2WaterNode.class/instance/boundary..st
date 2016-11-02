accessing
boundary: anObject
	boundary := anObject and.
	
	self isDebugging ifTrue: [ boundary enableDebug ].
