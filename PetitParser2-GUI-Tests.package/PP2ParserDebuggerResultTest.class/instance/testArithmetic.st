tests
testArithmetic
	| parser result |
	parser := PP2ExpressionParser new.
	result := parser debug: '1 + 2'.
	self assert: result debugResult children size equals: 1.
	self assert: result debugResult children first result equals: #(1 $+ 2)