tests
testProfilingContext
	| parser result |
	parser := PP2ExpressionParser new productionAt: #number.
	result := parser debug: '1'.
	self assert: result isKindOf: PP2RecordingContext.