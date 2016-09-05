tests - profiling
testParserRefreshCache
	| parser context |

	parser := (#letter asParser2 plus token trim, #word asParser2 star token trim) flatten.
	parser optimize.
	self assert:( parser allCaches noneSatisfy: [:c | c isProfiling ]).

	
	context := self contextOn: ''.
	context parser: parser.
	self assert: parser allCaches size equals: 2.
	self assert:( parser allCaches allSatisfy: [:c | c isProfiling ]).
	