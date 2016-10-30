parsing
parseOn: context
	| retval stackTop memento |
	memento := context remember.
	retval := node child parseOn: context.
	retval isPetit2Failure ifTrue: [ ^ retval ].
	
	^ ((stackTop := (context stackNamed: node stackId) top) = retval) ifTrue: [  
		retval
	] ifFalse: [ 
		context restore: memento.
		PP2Failure message: ('context stack value: "', stackTop asString, 
								   '" does not match ', retval asString)
					  context: context
	]