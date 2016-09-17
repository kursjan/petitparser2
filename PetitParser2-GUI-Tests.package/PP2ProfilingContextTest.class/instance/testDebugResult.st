tests - debugging
testDebugResult
	| context parser resultContext |
	context := PP2ProfilingContext new.
	
	parser := 'foo' asPParser star.
	resultContext := parser debug: 'foofoofoo' withContext: context.
	
	self assert: resultContext retval isPetit2Success.
	self assert: context debugResult isNil not.
	self assert: context debugResult children size equals: 1.