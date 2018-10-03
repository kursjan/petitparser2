Class {
	#name : #PP2SeaOptimizationVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'sea',
		'parser'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #asserting }
PP2SeaOptimizationVisitorTest >> assert: set anySatisfy: aBlock [
	self assert: (set anySatisfy: aBlock)	
]

{ #category : #asserting }
PP2SeaOptimizationVisitorTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #asserting }
PP2SeaOptimizationVisitorTest >> assert: set noneSatisfy: aBlock [
	self assert: (set noneSatisfy: aBlock)	
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testJustSea [
	parser := $a asPParser sea.
	
	self visit: parser.
	self assert: parser strategy isKindOf: PP2Sea
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testMemoizedSea [
	sea := $a asPParser sea.
	
	parser := sea, ($a asPParser / sea).
	
	self visit: parser.
	self assert: sea strategy isKindOf: PP2MemoizedSea.
	self assert: sea afterWater allNodes anySatisfy: [ :n | n isSea ]
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testNestedSea [
	sea := $a asPParser sea.
	
	parser := sea star sea.
	self visit: parser.

	self assert: sea strategy isKindOf: PP2Sea.
	self assert: sea afterWater boundaryElements noneSatisfy: [ :e | e isSea ].
	self assert: sea afterWater boundaryElements anySatisfy: [ :e | e == sea island ]
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testOverlappingSeas [
	| seaOne seaTwo |
	seaOne := $a asPParser sea.
	seaTwo := $b asPParser sea.
	
	parser := seaOne, seaTwo.
	
	self visit: parser.
	self assert: seaOne strategy isKindOf: PP2Sea.
	self assert: seaTwo strategy isKindOf: PP2Sea.
	self assert: seaOne afterWater allNodes noneSatisfy: [ :n | n isSea ]
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testRepetitionInBoundary [
	sea := $a asPParser sea.
	parser := sea, $b asPParser plus.
	
	self visit: parser.
	self assert: sea beforeWater boundaryElements noneSatisfy: [ :e | e isRepeating ].	
	self assert: sea afterWater boundaryElements noneSatisfy: [ :e | e isRepeating ].
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testSeaInBoundary [
	parser := $a asPParser sea.
	
	self visit: parser.
	self assert: parser strategy isKindOf: PP2Sea.
	self assert: parser beforeWater boundaryElements noneSatisfy: [ :e | e isSea ].
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testSeaOptimizations [
	| bw aw |
	sea := $a asPParser sea.
	
	parser := sea star.
	self visit: parser.
	bw := sea beforeWater boundary.
	aw := sea afterWater boundary.

	parser parse: '..a..'.
	
	self assert: sea beforeWater boundary == bw.
	self assert: sea afterWater boundary == aw.
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testSeaOptimizationsReset [
	| bw aw |
	sea := $a asPParser sea.
	
	parser := sea star.
	self visit: parser.
	bw := sea beforeWater boundary.
	aw := sea afterWater boundary.

	sea parse: '..a..'.
	
	self assert: sea beforeWater boundary ~= bw.
	self assert: sea afterWater boundary ~= aw.
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testSeaPlus [
	sea := $a asPParser sea.
	
	parser := sea plus.
	
	self visit: parser.
	self assert: sea strategy isKindOf: PP2Sea.
	self assert: sea afterWater allNodes noneSatisfy: [ :n | n isSea ]
]

{ #category : #tests }
PP2SeaOptimizationVisitorTest >> testSeaStar [
	sea := $a asPParser sea.
	
	parser := sea star.
	
	self visit: parser.
	self assert: sea strategy isKindOf: PP2Sea.
	self assert: sea afterWater allNodes noneSatisfy: [ :n | n isSea ]
]

{ #category : #visiting }
PP2SeaOptimizationVisitorTest >> visit: node [
	PP2SeaOptimizationVisitor new visit: node
]
