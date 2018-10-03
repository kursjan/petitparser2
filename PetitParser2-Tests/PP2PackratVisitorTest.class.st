Class {
	#name : #PP2PackratVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Optimizations'
}

{ #category : #asserting }
PP2PackratVisitorTest >> assertMemoized: node [

	visitor visit: node.
	
	self assert: (node isMemoized).
]

{ #category : #asserting }
PP2PackratVisitorTest >> denyMemoized: node [

	visitor visit: node.
	
	self deny: (node isMemoized).
]

{ #category : #running }
PP2PackratVisitorTest >> setUp [
	visitor := PP2PackratVisitor new
]

{ #category : #tests }
PP2PackratVisitorTest >> testMemoize [
	parser := $a asPParser memoize.
	
	self assertMemoized: parser.
]

{ #category : #tests }
PP2PackratVisitorTest >> testMemoizeMatch [
	parser := $a asPParser match memoize.
	
	self assertMemoized: parser.
]

{ #category : #tests }
PP2PackratVisitorTest >> testMemoizeMemoized [
	parser := $a asPParser memoize memoize.
	
	self assertMemoized: parser.
	self assert: parser strategies size equals: 2.
]

{ #category : #tests }
PP2PackratVisitorTest >> testMemoizePop [
	parser := $a asPParser pop memoize.
	
	self denyMemoized: parser.
	self assert: parser warnings size equals: 1.
]

{ #category : #tests }
PP2PackratVisitorTest >> testMemoizePush [
	parser := $a asPParser push memoize.
	
	self denyMemoized: parser.
	self assert: parser warnings size equals: 1.
]
