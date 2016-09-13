parsing
parseOn: context
	| intValue |
	context atEnd ifTrue: [ ^ retval ].

	intValue := context uncheckedPeek asInteger.
	(intValue between: 0 and: 128) ifFalse: [  
		^ strategy parseOn: context
	].
	
	(classification at: intValue) ifFalse: [ 
		^ retval
	].

	^ strategy parseOn: context

