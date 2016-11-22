tests - profiling
testMultipleProfilingStrategies
	| cache parser context debugging |

	parser := #letter asPParser.
	cache := parser strategy cache.
	debugging := PP2DebuggingStrategy on: cache.
	parser strategy: debugging.
	
	context := self contextOn: ''.
	context parser: parser.
	
	self assert: parser strategies size equals: 3.
	self assert: (parser strategies first isKindOf: PP2RecordingDebuggingStrategy).
	self assert: (parser strategies second isKindOf: PP2RecordingCache).
	