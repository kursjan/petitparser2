tests - debugging
testSwitchToDebugging
	| parser context |

	parser := (#letter asPParser plus token trim, #word asPParser star token trim) flatten.
	parser optimize.
	self assert:( parser allCaches noneSatisfy: [:c | c isRecording ]).

	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser allCaches size equals: 2.
	self assert:( parser allCaches allSatisfy: [:c | c isRecording ]).
	