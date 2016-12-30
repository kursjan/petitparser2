parsing
parseOn: context
	| retval position |

	retval := OrderedCollection new.
	position := context rememberPosition.

	[ 
		context atEnd ifTrue: [ 
			context restorePosition: position.
			^ PP2Failure message: 'boundary not found' context: context
		].

		predicate value: context uncheckedPeek
	] whileFalse: [  
		retval addLast: context uncheckedNext
	].

	^ retval
