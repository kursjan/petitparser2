tests
testArithmeticCache
	| parser result number links |
	parser := PP2ExpressionParser new.
	number := (parser productionAt: #number).
	number strategy: number strategy cache.
	
	result := parser debug: '1'.
	links := result debugResult allResults select: [ :e | 
		e children isEmpty not and: [ e children first isKindOf: PP2DebugResultLink ]
	] thenCollect: [ :e | e children first ].

	self assert: links size equals: 2.
	self assert: links allSatisfy: [ :l | l reference parser name = #number ].