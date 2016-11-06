parsing
parseOn: context
	| retval stackTop memento stack |
	memento := context remember.
	retval := node child parseOn: context.
	retval isPetit2Failure ifTrue: [ ^ retval ].
	stack := context stackNamed: node stackId.
	
	^ (stack isEmpty not and: [(stackTop :=  stack top) = retval]) ifTrue: [  
		retval
	] ifFalse: [ 
		context restore: memento.
		PP2Failure message: ('context stack value: "', stackTop asString, 
								   '" does not match ', retval asString)
					  context: context
	]