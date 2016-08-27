tests
testNumberParser
	| parser result |
	parser := PP2ExpressionParser new productionAt: #number.
	result := parser debug: '1'.
	self assert: result children size equals: 1.
	self assert: result children first result equals: 1