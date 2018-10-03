Class {
	#name : #PP2FirstSetVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor',
		'firstSet'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #converting }
PP2FirstSetVisitorTest >> assert: aSet anySatisfy: anObject [
	self assert: (aSet anySatisfy: anObject)
]

{ #category : #converting }
PP2FirstSetVisitorTest >> assert: aSet includes: anObject [
	self assert: (aSet includes: anObject)
]

{ #category : #accessing }
PP2FirstSetVisitorTest >> firstSet: aPP2Node [
	^ PP2FirstSetVisitor firstSet visit: aPP2Node
]

{ #category : #accessing }
PP2FirstSetVisitorTest >> firstSetWithProduction: aPP2Node [
	^ PP2FirstSetVisitor productionSet visit: aPP2Node
]

{ #category : #'tests - seas or terminals' }
PP2FirstSetVisitorTest >> firstSetWithSeasOrTerminals: node [
	^ PP2FirstSetVisitor seasOrTerminalsSet visit: node
]

{ #category : #accessing }
PP2FirstSetVisitorTest >> firstSetWithTokens: aPP2Node [
	^ PP2FirstSetVisitor tokenSet visit: aPP2Node
]

{ #category : #accessing }
PP2FirstSetVisitorTest >> firstSetWithoutDuplicates: aPP2Node [
	^ self withoutDuplicates: (PP2FirstSetVisitor firstSet visit: aPP2Node)
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testAdaptable [
	parser := PP2AdaptableNode new.
	parser changeChild: $a asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	
	1 to: 255 do: [ :index | 
		self assert: firstSet anySatisfy: [ :e | 
			(e parse: (Character codePoint: index) asString) isPetit2Success 
		]
	]
	
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testAnd [
	| sequence |
	parser := #letter asPParser.
	sequence := parser and, $b asPParser.
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testChoice [
	| parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
		
	firstSet := self firstSet: parserOne / parserTwo.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testCycle [
	| delegateOne delegateTwo sequence |
	delegateOne := PP2DelegateNode new.
	delegateTwo := PP2DelegateNode new.
	sequence := nil asPParser, delegateTwo.
	
	delegateOne child: delegateTwo.
	delegateTwo child: delegateOne.
	
	self should: [ firstSet := self firstSet: sequence ] raise: Error.
"	self assert: firstSet isEmpty"
]

{ #category : #'tests - productions' }
PP2FirstSetVisitorTest >> testDeepProductions [
	| productionTop productionOne productionTwo |
	productionOne := 'foo' asPParser name: 'bar'.
	productionTwo := 'bar' asPParser name: 'baz'.
	productionTop := (productionOne / productionTwo) wrapped name: 'bark'.
	parser := productionTop plus.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 3.
	self assert: (firstSet includes: productionOne).
	self assert: (firstSet includes: productionTwo).	
	self assert: (firstSet includes: productionTop).		
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testDelegate [
	| delegate  |
	parser := $a asPParser. 
	delegate := parser wrapped.
	
	firstSet := self firstSet: delegate.
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testEndOfInput [
	parser := PP2EndOfInputNode new.
	
	firstSet := self firstSet: parser.
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #'tests - tokens' }
PP2FirstSetVisitorTest >> testFirstWithTokensOneToken [
	| token  |
	token := $a asPParser token.
	parser := $b asPParser.
	
	firstSet := self firstSetWithTokens: token / parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: token.
	self assert: firstSet includes: parser.
]

{ #category : #'tests - tokens' }
PP2FirstSetVisitorTest >> testFirstWithTokensTwoTokens [
	| tokenOne tokenTwo trimmer |
	trimmer := $c asPParser.
	tokenOne := $a asPParser token.
	tokenTwo := $b asPParser token trim: trimmer.
	
	firstSet := self firstSetWithTokens: tokenOne / tokenTwo.
	
	self assert: firstSet size equals: 3.
	self assert: firstSet includes: tokenOne.
	self assert: firstSet includes: tokenTwo child.
	self assert: firstSet includes: tokenTwo trimmer.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testFlatten [
	| flattened |
	parser := #letter asPParser.
	flattened := parser, #word asPParser star.
	firstSet := self firstSet: flattened.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #'tests - seas or terminals' }
PP2FirstSetVisitorTest >> testJustSeaSoT [
	parser := $a asPParser sea.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.

]

{ #category : #tests }
PP2FirstSetVisitorTest >> testLiteralObject [
	parser := $a asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testLiteralSequence [
	parser := 'foo' asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testNonEpsilon [
	| terminal |
	terminal := $b asPParser.
	parser := terminal optional nonEpsilon.
	
	firstSet := self firstSet: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: terminal.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testNonEpsilonWithoutEpsilon [
	| terminal |
	terminal := $b asPParser.
	parser := terminal nonEpsilon.
	
	firstSet := self firstSet: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: terminal.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testNot [
	| sequence |
	parser := $a asPParser not.
	sequence := parser, $b asPParser.
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testOptional [
	| optional |
	parser := $a asPParser.
	optional := parser optional.
	firstSet := self firstSet: optional.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	self assert: firstSet includes: parser.
]

{ #category : #'tests - seas or terminals' }
PP2FirstSetVisitorTest >> testOptionalSeaSoT [
	| sea |
	sea := $a asPParser sea.
	parser := sea optional wrapped.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: sea
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testPluggable [
	parser := [:ctx | ctx next] asPParser.
	firstSet := self firstSet: parser.

	"JK: Not sure if it should contain epsilon or not"
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testPlus [
	| plus |
	parser := $a asPParser.
	plus := parser plus.
	firstSet := self firstSet: plus.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testPlusOptional [
	| plus |
	parser := $a asPParser.
	"JK: This should actually throw warning somewhere"
	plus := parser optional plus.
	firstSet := self firstSet: plus.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	self assert: firstSet includes: parser.
]

{ #category : #'tests - seas or terminals' }
PP2FirstSetVisitorTest >> testPossibleSeaSoT [
	| sea before |
	sea := $a asPParser sea.
	before := $b asPParser.
	parser := before optional, sea.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: sea.
	self assert: firstSet includes: before.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testPredicateObject [
	parser := #letter asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet anyOne equals: parser.
]

{ #category : #'tests - productions' }
PP2FirstSetVisitorTest >> testProductions [
	| productionOne productionTwo |
	productionOne := 'foo' asPParser name: 'bar'.
	productionTwo := 'bar' asPParser name: 'baz'.
	parser := productionOne / productionTwo.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 2.
	self assert: (firstSet includes: productionOne).
	self assert: (firstSet includes: productionTwo).	
]

{ #category : #'tests - productions' }
PP2FirstSetVisitorTest >> testProductionsSelf [
	parser := 'foo' asPParser name: 'bar'.
	
	firstSet := self firstSetWithProduction: parser.
	self assert: firstSet size equals: 1.
	self assert: (firstSet includes: parser)
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSea [
	| sea |
	parser := $a asPParser.
	sea := parser sea.
	firstSet := self firstSetWithoutDuplicates: sea.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: #any asPParser. 

]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSeaNullable [
	| sea |
	parser := $a asPParser.
	sea := parser optional sea.
	firstSet := self firstSetWithoutDuplicates: sea.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: #any asPParser.
	self assert: firstSet includes: #eoi asPParser.	
]

{ #category : #'tests - seas or terminals' }
PP2FirstSetVisitorTest >> testSeaRepetitionSoT [
	| sea |
	sea := $a asPParser sea.
	parser := sea plus.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: sea.

]

{ #category : #'tests - seas or terminals' }
PP2FirstSetVisitorTest >> testSeaSoT [
	| sea |
	sea := $a asPParser sea.
	parser := sea wrapped.
	
	firstSet := self firstSetWithSeasOrTerminals: parser.
	
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: sea.

]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSeaWaterTokens [
	| sea waterToken tokenOne tokenTwo |
	parser := $a asPParser.
	tokenOne := $b asPParser.
	tokenTwo := $c asPParser.
	waterToken := tokenOne / tokenTwo.
	
	sea := parser sea: waterToken.
	firstSet := self firstSetWithoutDuplicates: sea.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: tokenOne.
	self assert: firstSet includes: tokenTwo.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSequence [
	| sequence |
	parser := $a asPParser.
	sequence := parser, $b asPParser.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSequenceTwoEpsilons [
	| sequence parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := nil asPParser.
	sequence := parserOne star, parserTwo.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSequenceTwoStars [
	| sequence parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
	sequence := parserOne star, parserTwo star.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo.
	self assert: firstSet includes: PP2EpsilonNode instance
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSequenceWithNil [
	| sequence parserOne parserTwo |
	parserOne := nil asPParser.
	parserTwo := $b asPParser.
	sequence := parserOne, parserTwo.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parserTwo
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testSequenceWithStar [
	| sequence parserOne parserTwo |
	parserOne := $a asPParser.
	parserTwo := $b asPParser.
	sequence := parserOne star, parserTwo.
	 
	firstSet := self firstSet: sequence.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parserOne.
	self assert: firstSet includes: parserTwo
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testStar [
	| star |
	parser := $a asPParser.
	star := parser star.
	firstSet := self firstSet: star.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: PP2EpsilonNode instance
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testStartOfLine [
	parser := #startOfLine asPParser.
	firstSet := self firstSet: parser.

	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testToken [
	| token |
	parser := 'foo' asPParser.
	token := parser token.
	firstSet := self firstSet: token.

	self assert: firstSet size equals: 1.
	self assert: firstSet anyOne equals: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testTrimming [
	| trimming |
	parser := 'foo' asPParser.
	trimming := parser trim.
	firstSet := self firstSet: trimming.

	self assert: firstSet size equals: 2.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: trimming trimmer child.	
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testTrimmingWithEpsilon [
	| trimming |
	parser := 'foo' asPParser.
	trimming := parser optional trim.
	firstSet := self firstSet: trimming.

	self assert: firstSet size equals: 3.
	self assert: firstSet includes: parser.
	self assert: firstSet includes: trimming trimmer child.	
	self assert: firstSet includes: PP2EpsilonNode instance.		
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testTwoParents [
	| sequence |
	parser := $a asPParser.
	sequence := parser star, parser star.
	
	firstSet := self firstSet: sequence.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: PP2EpsilonNode instance.
	self assert: firstSet includes: parser.

]

{ #category : #tests }
PP2FirstSetVisitorTest >> testWaterFirstSet [
	| boundary waterToken |
	boundary := $b asPParser.
	waterToken := $a asPParser.
	parser := PP2WaterNode new boundary: boundary; waterToken: waterToken.
	
	firstSet := self firstSet: parser.
	
	self assert: firstSet size equals: 2.
	self assert: firstSet includes: boundary.
	self assert: firstSet includes: waterToken.

]

{ #category : #tests }
PP2FirstSetVisitorTest >> testWrapping [
	parser := $a asPParser >=> [:c :cc | cc value].
	firstSet := self firstSet: parser.

	"JK: Not sure if it should contain epsilon or not"
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: parser.
]

{ #category : #tests }
PP2FirstSetVisitorTest >> testWrappingNonFunctional [
	| literal |
	literal := $a asPParser.
	parser := literal >==> [:c :cc | cc value].
	firstSet := self firstSet: parser.

	"JK: Not sure if it should contain epsilon or not"
	self assert: firstSet size equals: 1.
	self assert: firstSet includes: literal.
]

{ #category : #accessing }
PP2FirstSetVisitorTest >> withoutDuplicates: set [
	| newSet |
	newSet := Set new.
	newSet addAll: set.
	^ newSet
]
