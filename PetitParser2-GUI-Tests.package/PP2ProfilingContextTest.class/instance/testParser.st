tests - profiling
testParser
	| parser context |

	parser := #letter asParser2.
	parser strategy: parser strategy cache.
	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser strategies size equals: 2.
	self assert: (parser strategy isKindOf: PP2ProfilingCache).
	