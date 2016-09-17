tests - profiling
testParser
	| parser context |

	parser := #letter asPParser.
	parser strategy: parser strategy cache.
	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser strategies size equals: 2.
	self assert: (parser strategy isKindOf: PP2ProfilingCache).
	