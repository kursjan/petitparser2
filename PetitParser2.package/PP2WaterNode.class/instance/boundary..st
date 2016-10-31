accessing
boundary: anObject
	boundary := anObject and.
	
	self strategy isDebugging ifTrue: [ boundary enableDebug ]