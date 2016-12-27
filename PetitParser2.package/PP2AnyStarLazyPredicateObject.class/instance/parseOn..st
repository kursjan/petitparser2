parsing
parseOn: context
	| retval memento |

	retval := OrderedCollection new.
	memento := self remember: context.	

	[ 
		context atEnd ifTrue: [ 
			self restore: context from: memento.
			^ PP2Failure message: 'boundary not found' context: context
		].

		predicate value: context uncheckedPeek
	] whileFalse: [  
		retval addLast: context uncheckedNext
	].

	^ retval
