Class {
	#name : #PP2SeaNodeTest,
	#superclass : #TestCase,
	#traits : 'TPP2TypeAssertions + TPP2CollectionAssertions',
	#classTraits : 'TPP2TypeAssertions classTrait + TPP2CollectionAssertions classTrait',
	#instVars : [
		'parser',
		'sea'
	],
	#category : 'PetitParser2-Tests-Nodes'
}

{ #category : #tests }
PP2SeaNodeTest >> testAfterWater [
	sea := PP2SeaNode new
		island: $a asPParser;
		yourself.

	self assert: sea afterWater isKindOf: PP2WaterNode.

]

{ #category : #tests }
PP2SeaNodeTest >> testBeforeWater [
	sea := PP2SeaNode new
		island: $a asPParser;
		yourself.

	self assert: sea beforeWater isKindOf: PP2WaterNode.
]

{ #category : #tests }
PP2SeaNodeTest >> testChildren [
	| waterToken island |
	waterToken := #space asPParser.
	island := $a asPParser optional.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.

	self assert: sea children size equals: 3.
	self assert: sea children first isKindOf: PP2Node.
	self assert: sea children second == island.
	self assert: sea children third isKindOf: PP2Node.
]

{ #category : #tests }
PP2SeaNodeTest >> testNonNullableIsland [
	| waterToken island beforeWater boundary elements |
	waterToken := #space asPParser.
	island := $a asPParser optional.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser.
		
	parser := sea, boundary.
	
	sea updateBeforeWater: parser.
	beforeWater := sea beforeWater.
			
	elements := beforeWater boundaryElements.
	self assert: elements size equals: 2.	
	self assert: elements noneSatisfy: [ :e | e isNullable  ].
]

{ #category : #tests }
PP2SeaNodeTest >> testUpdateAfterWater [
	| waterToken island afterWater boundary elements nextBoundary |
	waterToken := #space asPParser.
	island := $a asPParser.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser optional.
	nextBoundary := $c asPParser.
		
	parser := sea, boundary, nextBoundary.
	
	sea updateAfterWater: parser.
	afterWater := sea afterWater.
	
	self assert: afterWater isKindOf: PP2WaterNode.
	self assert: afterWater waterToken equals: waterToken.
	self assert: afterWater boundary isKindOf: PP2ChoiceNode.
	self assert: afterWater boundary children allSatisfy: [ :child | child isKindOf: PP2AndNode].	
		
	elements := afterWater boundaryElements.
	self assert: elements size equals: 2.	
	self assert: elements noneSatisfy: [ :n | n isNullable ].
	self assert: elements includes: nextBoundary.	
]

{ #category : #tests }
PP2SeaNodeTest >> testUpdateBeforeWater [
	| waterToken island beforeWater boundary elements |
	waterToken := #space asPParser.
	island := $a asPParser.
	sea := PP2SeaNode new
		island: island;
		waterToken: waterToken;
		yourself.
	boundary := $b asPParser.
		
	parser := sea, boundary.
	
	sea updateBeforeWater: parser.
	beforeWater := sea beforeWater.
	
	self assert: beforeWater isKindOf: PP2WaterNode.
	self assert: beforeWater waterToken equals: waterToken.
	self assert: beforeWater boundary isKindOf: PP2ChoiceNode.
	self assert: beforeWater boundary children allSatisfy: [ :child | child isKindOf: PP2AndNode ].	
		
	elements := beforeWater boundaryElements.
	self assert: elements size equals: 2.	
	self assert: elements includes: island.
	self assert: elements includes: boundary.
]
