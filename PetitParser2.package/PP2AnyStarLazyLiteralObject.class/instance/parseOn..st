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

		context uncheckedPeek == literal
	] whileFalse: [  
		retval addLast: context uncheckedNext
	].

	^ retval
