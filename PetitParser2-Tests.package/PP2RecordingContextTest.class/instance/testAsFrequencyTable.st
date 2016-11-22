tests - profiling
testAsFrequencyTable
	| parser context table |
	parser := PP2ExpressionParser new optimize enableDebug.
	context := self contextOn: '1+2'.
	
	parser parseWithContext: context.
	
	table := context asFrequencyTable.
	self assert: (table collect: #first) noneSatisfy: [ :e | e isNil ].
	self assert: (table collect: #second) allSatisfy: [ :e | e isNumber ].
	self assert: (table collect: #third) allSatisfy: [ :e | e isNumber ].
	
	"This comes from the parseAdaptableWithContext, when remember is called"
	self assert: (context eventsTrace strategies) anySatisfy: [ :e | e isKindOf: PP2NilStrategy  ]