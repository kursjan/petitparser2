parsing - private
parseWithContext: startContext
	| context |
	context := parser parseWithContext:  startContext.
	context atEnd 
		ifTrue: [ ^ context ]
		ifFalse: [ ^ context failure: 'end of input expected' ]