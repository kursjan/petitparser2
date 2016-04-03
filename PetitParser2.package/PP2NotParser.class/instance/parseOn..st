parsing - private
parseOn: startContext
	| context |
	context := parser parseWithContext:  startContext.
	^ context isPetit2Failure 
		ifTrue: [ startContext setValue: nil ]
		ifFalse: [ startContext failure: 'I was not expected to pass' ]