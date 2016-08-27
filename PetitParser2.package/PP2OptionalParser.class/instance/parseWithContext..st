parsing - private
parseWithContext: startContext
	| context |
	context := parser parseWithContext:  startContext.
	^ context isPetit2Failure 
		ifTrue: [ startContext setValue: nil ]
		ifFalse: [ context ]