Class {
	#name : #PP2IsNullableVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #support }
PP2IsNullableVisitorTest >> assertIsNullable: node [
	| retval |
	retval := visitor visit: node.
	self assert: retval
]

{ #category : #support }
PP2IsNullableVisitorTest >> denyIsNullable: node [
	| retval |
	retval := visitor visit: node.
	self assert: retval not
]

{ #category : #running }
PP2IsNullableVisitorTest >> setUp [
	super setUp.
	
	visitor := PP2IsNullableVisitor new
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testAction [
	self denyIsNullable: #letter asPParser ==> [ :foo | foo ].
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testActionEmpty [
	self assertIsNullable: nil asPParser ==> [ :foo | foo ].	
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testAdaptable [
	parser := PP2AdaptableNode new.
	parser changeChild: $a asPParser.

	self denyIsNullable: parser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testAdaptableEpsilon [
	parser := PP2AdaptableNode new.
	parser changeChild: nil asPParser.

	self denyIsNullable: parser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testAnd [
	self denyIsNullable: #letter asPParser and

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testBlock [
	| block |
	block := [ :context | context next ] asPParser.
	self denyIsNullable: block.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testBlockAcceptsEpsilon [
	| block |
	block := [ :context | context next ] asPParser
					isNullable: true;
					yourself.
	self assertIsNullable: block.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testCycle [
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := nil asPParser, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self should: [ self assertIsNullable: sequence ] raise: Error
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testCycleNoRecursion [
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := $a asPParser, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self denyIsNullable: sequence
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testEmptyLiteral [
	self assertIsNullable: '' asPParser
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testEnd [
	self denyIsNullable: 'foo' asPParser end
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testEndEmpty [
	self assertIsNullable: nil asPParser end
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testEndOfInput [
	self denyIsNullable: PP2EndOfInputNode new
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testLiteral [
	self denyIsNullable: 'foo' asPParser
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testLiteralObject [
	self denyIsNullable: $a asPParser.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testNil [
	self assertIsNullable: nil asPParser optional.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testNot [
	self denyIsNullable: #letter asPParser not

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testOptional [
	self assertIsNullable: #letter asPParser optional.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testPluggable [
	self denyIsNullable: [:ctx | ctx] asPParser.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testPlus [
	self denyIsNullable: #letter asPParser plus.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testPlusEplsilon [
	self assertIsNullable: nil asPParser plus.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testPredicate [
	self denyIsNullable: #letter asPParser.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testPredicateObject [
	self denyIsNullable: #letter asPParser.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testPredicateObjectAny [
	self denyIsNullable: #any asPParser.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testSequence [
	self denyIsNullable: #letter asPParser, #word asPParser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testSequenceEmpty [
	self assertIsNullable: #letter asPParser optional, nil asPParser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testSequenceFirstEpsilon [
	self denyIsNullable: #letter asPParser optional, #word asPParser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testStar [
	self assertIsNullable: #letter asPParser star.
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testStartOfLine [
	self denyIsNullable: #startOfLine asPParser
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testWater [
	self denyIsNullable: (PP2WaterNode new boundary: nil asPParser).
	self denyIsNullable: (PP2WaterNode new boundary: $a asPParser).
]

{ #category : #tests }
PP2IsNullableVisitorTest >> testWrapping [
	parser := $a asPParser >=> [ :c :cc | cc value ].

	self denyIsNullable: parser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testWrappingAcceptsEpsilon [
	| wrapped |
	wrapped := $a asPParser >=> [ :context :cc |  ]
		isNullable: true;
		yourself.
	
	self assertIsNullable: wrapped

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testWrappingNonFunctional [
	parser := $a asPParser >==> [:c :cc | cc value].

	self denyIsNullable: parser

]

{ #category : #tests }
PP2IsNullableVisitorTest >> testWrappingNonFunctionalEpsilon [
	parser := nil asPParser >==> [:c :cc | cc value].

	self assertIsNullable: parser

]
