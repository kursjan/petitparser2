Class {
	#name : #PP2TrimmingCacheVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #support }
PP2TrimmingCacheVisitorTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #'as yet unclassified' }
PP2TrimmingCacheVisitorTest >> setUp [
	super setUp.
	
	visitor := PP2TrimmingCacheVisitor new
]

{ #category : #'as yet unclassified' }
PP2TrimmingCacheVisitorTest >> testDifferentTrimmers [
	parser := $a asPParser trimSpaces, $b asPParser trimBlanks.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2PossesiveRepeating.
	self assert: parser secondChild trimmer strategy isKindOf: PP2PossesiveRepeating	
]

{ #category : #'as yet unclassified' }
PP2TrimmingCacheVisitorTest >> testSequence [
	parser := $a asPParser trim, $b asPParser trim.
	
	visitor doPass: parser.
	self assert: parser firstChild trimmer strategy isKindOf: PP2TrimmingCache.
	self assert: parser secondChild trimmer strategy isKindOf: PP2TrimmingCache	
]

{ #category : #'as yet unclassified' }
PP2TrimmingCacheVisitorTest >> testSimpleTrimming [
	parser := $a asPParser trim.
	
	visitor doPass: parser.
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache
]

{ #category : #'as yet unclassified' }
PP2TrimmingCacheVisitorTest >> testSimpleTrimmingToken [
	parser := $a asPParser token trim.
	
	visitor doPass: parser.
	self assert: parser trimmer strategy isKindOf: PP2TrimmingCache
]
