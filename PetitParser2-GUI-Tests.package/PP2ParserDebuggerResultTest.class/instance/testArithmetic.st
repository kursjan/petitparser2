tests
testArithmetic
	| parser result |
	parser := PP2ExpressionParser new.
	result := parser debug: '1 + 2'.
	self assert: result children size equals: 1.
	self assert: result children first result equals: #(1 $+ 2)