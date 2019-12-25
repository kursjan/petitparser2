Class {
	#name : #PP2ContextMemoizationVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : #'PetitParser2-Tests-Optimizations'
}

{ #category : #asserting }
PP2ContextMemoizationVisitorTest >> assertCFMemoization: node [

	visitor visit: node.
	
	self assert: (node memoizationStrategy isKindOf: PP2CFMemoization).
]

{ #category : #asserting }
PP2ContextMemoizationVisitorTest >> assertMemoized: node [

	visitor visit: node.
	
	self assert: (node isMemoized).
]

{ #category : #asserting }
PP2ContextMemoizationVisitorTest >> assertPopMemoization: node [

	visitor visit: node.
	
	self assert: (node memoizationStrategy isKindOf: PP2PopMemoization).
]

{ #category : #asserting }
PP2ContextMemoizationVisitorTest >> assertPushMemoization: node [

	visitor visit: node.
	
	self assert: (node memoizationStrategy isKindOf: PP2PushMemoization).
]

{ #category : #asserting }
PP2ContextMemoizationVisitorTest >> denyCFMemoization: node [

	visitor visit: node.
	
	self deny: (node memoizationStrategy isKindOf: PP2CFMemoization).
]

{ #category : #initialization }
PP2ContextMemoizationVisitorTest >> setUp [
	visitor := PP2ContextMemoizationVisitor new
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testAnd [
	parser := $a asPParser and.
	
	self assertCFMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testAndCS [
	parser := $a asPParser push and.
	
	self denyCFMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testAndPop [
	parser := $a asPParser pop and.
	
	self assertPopMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testAndPush [
	parser := $a asPParser push and.
	
	self assertPushMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testNonEpsilon [
	parser := $a asPParser nonEpsilon.
	
	self assertCFMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testNot [
	parser := $a asPParser not.
	
	self assertCFMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testNotCS [
	parser := $a asPParser push not.
	
	self denyCFMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testSequence [
	parser := $a asPParser, $b asPParser match, $c asPParser.
	
	self assertCFMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testSequencePop [
	parser := $a asPParser, $b asPParser pop, $c asPParser.
	
	self assertPopMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testSequencePush [
	parser := $a asPParser, $b asPParser push, $c asPParser.
	
	self assertPushMemoization: parser.
]

{ #category : #tests }
PP2ContextMemoizationVisitorTest >> testSequencePushPop [
	parser := $a asPParser push, #letter asPParser match, $a asPParser pop.
	
	self denyCFMemoization: parser.
]
