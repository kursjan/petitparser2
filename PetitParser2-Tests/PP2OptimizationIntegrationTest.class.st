Class {
	#name : #PP2OptimizationIntegrationTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait',
	#instVars : [
		'parser'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #tests }
PP2OptimizationIntegrationTest >> testAnyStarLazyLiteralObject [
	parser := #any asPParser starLazy, $a asPParser.
	
	parser optimize.
	
	self assert: parser firstChild strategy isKindOf: PP2AnyStarLazyLiteralObject.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testAnyStarLazyPredicateObject [
	parser := #any asPParser starLazy, #word asPParser.
	
	parser optimize.
	
	self assert: parser firstChild strategy isKindOf: PP2AnyStarLazyPredicateObject.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testBypass [
	parser := #letter asPParser wrapped star optimize.
	
	self assert: parser strategy child isKindOf: PP2PredicateObjectNode
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testCommonPrefix [
	| prefixOne prefixTwo |
	prefixOne := #letter asPParser star wrapped flatten name: 'id'.
	prefixTwo := #letter asPParser star wrapped flatten name: 'id'.
	
	parser := (prefixOne token trim) / ((prefixTwo, $a asPParser) token trim).
	
	parser optimize.
	
	self assert: prefixOne strategy isKindOf: PP2Cache.
	self assert: prefixTwo strategy isKindOf: PP2Cache.
	
	self assert: prefixOne strategy == prefixTwo strategy.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testIdentifier [
	parser := #letter asPParser, #word asPParser star.
	
	parser optimize.
	
	self assert: parser strategy isKindOf: PP2SequenceOfTwo.
	self assert: parser secondChild strategy isKindOf: PP2StarPredicateObject.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testIdentifierToken [
	parser := (#letter asPParser, #word asPParser star) token.
	
	parser optimize.
	
	self assert: parser child strategy isKindOf: PP2SequenceOfTwoRecognizer.
	self assert: parser child secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testIdentifierTrimmingToken [
	parser := (#letter asPParser, #word asPParser star) token trim.
	
	parser optimize.
	
	self assert: parser strategy isKindOf: PP2TrimmingToken.
	self assert: parser strategy tokenChild strategy isKindOf: PP2SequenceOfTwoRecognizer.
	self assert: parser strategy tokenChild firstChild strategy isKindOf: PP2PredicateObjectRecognizer.
	self assert: parser strategy tokenChild secondChild strategy isKindOf: PP2StarPredicateObjectRecognizer.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testMemoization [
	| id |
	id := #any asPParser, #word asPParser star.
	id memoize.
	
	parser := id / id optional.
	parser optimize.
	
	self assert: id strategy isKindOf: PP2Packrat.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testTrimming [
	parser := #letter asPParser trim optimize.
	
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache.
	self assert: parser trimmer strategy strategy isKindOf: PP2StarPredicateObjectRecognizer.
]

{ #category : #tests }
PP2OptimizationIntegrationTest >> testTrimmingToken [
	parser := #letter asPParser trim optimize.
	
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache.
	self assert: parser trimmer strategy strategy isKindOf: PP2StarPredicateObjectRecognizer.
]
