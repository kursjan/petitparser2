Class {
	#name : #PP2CommonPrefixVisitorTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions + TPP2CollectionAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait + TPP2CollectionAssertions classTrait',
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #running }
PP2CommonPrefixVisitorTest >> setUp [
	super setUp.
	
	visitor := PP2CommonPrefixVisitor new
]

{ #category : #tests }
PP2CommonPrefixVisitorTest >> testChoice [
	| production |
	production := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := production / ($a asPParser optional, production wrapped).
	
	self visit: parser.
	
	self assert: production strategy isKindOf: PP2Cache.
]

{ #category : #tests }
PP2CommonPrefixVisitorTest >> testChoiceNonIdentical [
	| productionOne productionTwo |
	productionOne := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	productionTwo := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := productionOne / ($a asPParser optional, productionTwo wrapped).
	
	self visit: parser.
	
	self assert: productionOne strategy isKindOf: PP2Cache.
	self assert: productionOne strategy isKindOf: PP2Cache.
	self assert: productionOne strategy == productionTwo strategy.	
]

{ #category : #tests }
PP2CommonPrefixVisitorTest >> testSea [
	| island |
	island := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := island sea.
	
	self visit: parser.
	
	self assert: island strategy isKindOf: PP2Cache.
]

{ #category : #tests }
PP2CommonPrefixVisitorTest >> testSeaBoundary [
	| sea |
	sea := $a asPParser star trim flatten wrapped sea.
	
	parser := $b asPParser plus trim wrapped flatten.
	sea beforeWater boundaryElements: parser.
	sea afterWater boundary: parser.
	
	self visit: sea.
	self assert: sea beforeWater boundaryElements allSatisfy: [:e | e strategy isKindOf: PP2Cache ].
	self assert: sea afterWater boundaryElements allSatisfy: [:e | e strategy isKindOf: PP2Cache ].	
]

{ #category : #tests }
PP2CommonPrefixVisitorTest >> testSeaNested [
	| sea |
	sea := $a asPParser sea.
	
	parser := (sea ==> #second) sea.
	sea beforeWater boundary: $b asPParser plus flatten trim.
	sea afterWater boundary: $c asPParser plus flatten trim.
	self visit: parser.
	
	self assert: sea beforeWater boundaryElements allSatisfy: [ :e | e strategy isKindOf: PP2Cache ].
	self assert: sea afterWater boundaryElements allSatisfy: [ :e | e strategy isKindOf: PP2Cache ].	
]

{ #category : #tests }
PP2CommonPrefixVisitorTest >> testSequence [
	| production |
	production := 'foo' asPParser plus wrapped trim ==> [ :foo | foo ]
		name: 'production';
		yourself.
	
	parser := (production, $a asPParser) star, production wrapped.
	
	self visit: parser.
	
	self assert: production strategy isKindOf: PP2Cache.
]

{ #category : #visiting }
PP2CommonPrefixVisitorTest >> visit: node [
	visitor visit: node
]
