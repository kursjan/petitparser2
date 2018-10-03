Class {
	#name : #PP2GuardVisitorTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #support }
PP2GuardVisitorTest >> assert: booleanArray at: position [
	self assert: (booleanArray at: position)
]

{ #category : #support }
PP2GuardVisitorTest >> deny: booleanArray at: position [
	self assert: (booleanArray at: position) not
]

{ #category : #support }
PP2GuardVisitorTest >> optimize: node [
	PP2IsNullableCache new doPass: node.
	PP2FirstSetCache new doPass: node.
	PP2GuardVisitor new doPass: node
]

{ #category : #running }
PP2GuardVisitorTest >> setUp [
	super setUp.
	
	visitor := PP2GuardVisitor new
]

{ #category : #tests }
PP2GuardVisitorTest >> testChoice [
	| parserOne parserTwo |
	parserOne := 'foo' asPParser token trim wrapped.
	parserTwo := 'bar' asPParser token trim wrapped.
	
	self optimize: parserOne / parserTwo.
	
	self assert: parserOne strategy isKindOf: PP2ParsingGuard.
	self assert: parserOne strategy classification isNotNil.
	
	self assert: parserTwo strategy isKindOf: PP2ParsingGuard.
	self assert: parserTwo strategy classification isNotNil.
]

{ #category : #tests }
PP2GuardVisitorTest >> testClassificationFor [
	| classification |
	parser := $a asPParser / $b asPParser.
	
	classification := visitor classificationFor: parser.
	
	self assert: classification at: $a codePoint.
	self assert: classification at: $b codePoint.
	self deny: classification at: $" codePoint.
	self deny: classification at: $c codePoint.	
]

{ #category : #tests }
PP2GuardVisitorTest >> testClassificationFor2 [
	| classification |
	parser := #letter asPParser / #digit asPParser.
	
	classification := visitor classificationFor: parser.
	
	1 to: 255 do: [ :index | 
		self assert: (classification at: index) equals: ((Character codePoint: index )isAlphaNumeric).
	]
]

{ #category : #tests }
PP2GuardVisitorTest >> testClassificationFor3 [
	| classification |
	parser := #letter asPParser / #eoi asPParser.
	
	classification := visitor classificationFor: parser.
	
	self assert: classification equals: (Array new: 255 withAll: true).
]

{ #category : #tests }
PP2GuardVisitorTest >> testDelegate [
	parser := 'foo' asPParser plus flatten wrapped.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy classification isNotNil.
]

{ #category : #tests }
PP2GuardVisitorTest >> testDelegateWithOptional [
	parser := ('foo' asPParser / 'bar' asPParser optional) wrapped.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2Delegate.
]

{ #category : #tests }
PP2GuardVisitorTest >> testGuardedChoice [
	| parserOne parserTwo parserThree choiceOne |
	parserOne := 'foo' asPParser token trim wrapped.
	parserTwo := 'bar' asPParser token trim wrapped.
	parserThree := 'baz' asPParser token trim wrapped.
	
	choiceOne := (parserOne / parserTwo) wrapped.
	
	self optimize: choiceOne / parserThree.
	
	self assert: choiceOne strategy isKindOf: PP2ParsingGuard.
	self assert: choiceOne strategy classification isNotNil.
	
	self assert: parserThree strategy isKindOf: PP2ParsingGuard.
	self assert: parserThree strategy classification isNotNil.
	
	self assert: parserOne strategy isKindOf: PP2ParsingGuard.
	self assert: parserTwo strategy isKindOf: PP2ParsingGuard.

]

{ #category : #tests }
PP2GuardVisitorTest >> testGuardedChoice2 [
	| parserOne parserTwo parserThree choiceOne |
	parserOne := 'baz' asPParser token trim wrapped.
	parserTwo := 'bar' asPParser token trim wrapped.
	parserThree := 'foo' asPParser token trim wrapped.
	
	choiceOne := (parserOne / parserTwo) wrapped.
	parser := choiceOne / parserThree.

	self optimize: parser.
	
	self assert: choiceOne strategy isKindOf: PP2ParsingGuard.
	self assert: choiceOne strategy classification isNotNil.
	
	self assert: parserThree strategy isKindOf: PP2ParsingGuard.
	self assert: parserThree strategy classification isNotNil.
	
	"already guarded by a parent!"
	self deny: parserOne strategy isKindOf: PP2ParsingGuard.
	self deny: parserTwo strategy isKindOf: PP2ParsingGuard.

]

{ #category : #tests }
PP2GuardVisitorTest >> testOptional [
	parser := 'foo' asPParser token trim optional.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy retval isNil.
]

{ #category : #tests }
PP2GuardVisitorTest >> testPlus [
	parser := 'foo' asPParser token trim plus.
	parser strategy: (PP2Plus on: parser).
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy retval isPetit2Failure.
]

{ #category : #tests }
PP2GuardVisitorTest >> testStar [
	parser := 'foo' asPParser token trim star.
	parser strategy: (PP2Star on: parser).
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy retval equals: #().
]

{ #category : #tests }
PP2GuardVisitorTest >> testTimes [
	parser := 'foo' asPParser token trim times: 3.
	
	self optimize: parser.
	
	self assert: parser strategy isKindOf: PP2ParsingGuard.
	self assert: parser strategy classification isNotNil.
	self assert: parser strategy retval isPetit2Failure
]
