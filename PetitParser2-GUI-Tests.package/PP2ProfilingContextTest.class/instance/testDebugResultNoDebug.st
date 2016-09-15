tests - debugging
testDebugResultNoDebug
	| context parser resultContext |
	context := PP2ProfilingContext new.
	
	parser := 'foo' asParser star.
	resultContext := parser parse: 'foofoofoo' withContext: context.
	
	self assert: resultContext retval isPetit2Success.
	self assert: context debugResult isNil not.
	self assert: context debugResult children isEmpty.