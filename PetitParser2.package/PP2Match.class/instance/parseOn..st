parsing
parseOn: context
	| retval stackTop memento stack |
	memento := self remember: context.
	retval := node child parseOn: context.
	retval isPetit2Failure ifTrue: [ ^ retval ].
	stack := context stackNamed: node stackId.
	
	^ (stack isEmpty not and: [(stackTop :=  stack top) = retval]) ifTrue: [  
		retval
	] ifFalse: [ 
		self restore: context from: memento.
		PP2Failure message: ('context stack value: "', stackTop asString, 
								   '" does not match ', retval asString)
					  context: context
	]