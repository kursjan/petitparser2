Class {
	#name : #PP2BypassVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> assert: anObject isKindOf: aClass [
	self assert: (anObject isKindOf: aClass)
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> setUp [
	visitor := PP2BypassVisitor new
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> testBypassCache [

	| cache |
	cache := $a asPParser wrapped.
	cache strategy: cache strategy cache.
	
	parser := cache plus.
	parser strategy: (PP2Plus on: parser).
	
	self visit: parser.
	
	self assert: parser strategy child isKindOf: PP2DelegateNode.
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> testPlus [

	parser := $a asPParser wrapped plus.
	parser strategy: (PP2Plus on: parser).
	
	self visit: parser.
	
	self assert: parser strategy child isKindOf: PP2LiteralObjectNode.
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> testSequenceOfTwo [

	parser := $a asPParser wrapped, $b asPParser wrapped.
	parser strategy: (PP2SequenceOfTwo on: parser).
	
	self visit: parser.
	
	self assert: parser strategy firstChild isKindOf: PP2LiteralObjectNode.
	self assert: parser strategy secondChild isKindOf: PP2LiteralObjectNode.	
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> testSequenceOfTwoRecognizer [

	parser := $a asPParser wrapped, $b asPParser wrapped.
	parser strategy: (PP2SequenceOfTwoRecognizer on: parser).
	
	self visit: parser.
	
	self assert: parser strategy firstChild isKindOf: PP2LiteralObjectNode.
	self assert: parser strategy secondChild isKindOf: PP2LiteralObjectNode.	
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> testStar [

	parser := $a asPParser wrapped star.
	parser strategy: (PP2Star on: parser).
	
	self visit: parser.
	
	self assert: parser strategy child isKindOf: PP2LiteralObjectNode.
]

{ #category : #'as yet unclassified' }
PP2BypassVisitorTest >> visit: node [
	visitor visit: node
]
