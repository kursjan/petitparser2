Class {
	#name : #PP2SpecializingVisitorTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #running }
PP2SpecializingVisitorTest >> setUp [
	visitor := PP2SpecializingVisitor new
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testAndLiteraObject [
	parser := $a asPParser and.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2AndLiteralObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testAndPredicateObject [
	parser := #letter asPParser and.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2AndPredicateObject
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testAnyStarLazyLiteralObject [
	| starLazy literal |
	starLazy := #any asPParser starLazy.
	literal := $a asPParser.
	parser := starLazy, literal.
	
	starLazy child updateAfterWater: parser.
	starLazy child updateBeforeWater: parser.
		
	visitor visit: parser.
	self assert: starLazy strategy isKindOf: PP2AnyStarLazyLiteralObject.
	self assert: starLazy strategy literal equals: literal literal.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testAnyStarLazyPredicateObject [
	| starLazy predicate |
	starLazy := #any asPParser starLazy.
	predicate := #letter asPParser.
	parser := starLazy, predicate.
	
	starLazy child updateAfterWater: parser.
	starLazy child updateBeforeWater: parser.
		
	visitor visit: parser.
	self assert: starLazy strategy isKindOf: PP2AnyStarLazyPredicateObject.
	self assert: starLazy strategy predicate equals: predicate predicate.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testIsAny [
	parser := #any asPParser.
	
	self assert: (visitor isAny: parser).
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testMappingOfThree [
	parser := ($a asPParser, $b asPParser, $c asPParser) map: [ :a :b :c | $d ].
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2MappingOfThree.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testMappingOfTwo [
	parser := ($a asPParser, $b asPParser) map: [ :a :b | $c ].
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2MappingOfTwo.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testNotLiteraObject [
	parser := $a asPParser not.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2NotLiteralObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testOptionalLiteraObject [
	parser := $a asPParser optional.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2OptionalLiteralObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testPlus [
	parser := $a asPParser plus.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2Plus.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testPlusPredicateObject [
	parser := #letter asPParser plus.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2PlusPredicateObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testPlusPredicateObject2 [
	parser := #letter asPParser plus.
	parser max: 20.
	
	visitor visit: parser.
	self deny: parser strategy isKindOf: PP2PlusPredicateObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testSequenceOfThree [
	parser := $a asPParser, $b asPParser, $c asPParser.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2SequenceOfThree.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testSequenceOfTwo [
	parser := $a asPParser, $b asPParser.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwo.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testStar [
	parser := $a asPParser star.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2Star.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testStarPredicateObject [
	parser := #letter asPParser star.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2StarPredicateObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testStarPredicateObject2 [
	parser := #letter asPParser star.
	parser max: 2.
	
	visitor visit: parser.
	self deny: parser strategy isKindOf: PP2StarPredicateObject.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testTrimmingLiteralObjectToken [
	parser := $a asPParser token trim.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2TrimmingLiteralObjectToken.
	self assert: parser strategy literal equals: $a.	
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testTrimmingLiteralObjectTokenWrapped [
	parser := $a asPParser wrapped token trim.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2TrimmingLiteralObjectToken.
	self assert: parser strategy literal equals: $a.
]

{ #category : #tests }
PP2SpecializingVisitorTest >> testTrimmingToken [
	parser := $a asPParser plus token trim.
	
	visitor visit: parser.
	
	self assert: parser strategy isKindOf: PP2TrimmingToken.
	self assert: parser strategy trimmer equals: parser trimmer.
	self assert: parser strategy tokenClass equals: parser child tokenClass.
]
