Class {
	#name : #PP2NoopVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'parser',
		'visitor',
		'result'
	],
	#category : 'PetitParser2-Tests-Core'
}

{ #category : #'as yet unclassified' }
PP2NoopVisitorTest >> setUp [
	super setUp.
	
	visitor := PP2MockNoopVisitor new
]

{ #category : #tests }
PP2NoopVisitorTest >> testVisitCharacter [
	parser := $a asPParser.
	result := visitor visit: parser.
	
	self assert: result equals: visitor
]

{ #category : #'as yet unclassified' }
PP2NoopVisitorTest >> testVisitCycle [
	| delegate |
	delegate := PP2DelegateNode new.
	parser := delegate, delegate.
	delegate child: parser.
	
	result := visitor visit: parser.
	
	self assert: result equals: visitor.
	
	self assert: (visitor closedSet includes: (PP2NoopContext with: parser)). 
	self assert: (visitor closedSet includes: (PP2NoopContext with: delegate)). 
	self assert: (visitor openSet isEmpty). 	
	
	self assert: visitor visitOrder size equals: 2.
	self assert: visitor visitOrder first equals: parser.
	self assert: visitor visitOrder second equals: delegate.

]

{ #category : #'as yet unclassified' }
PP2NoopVisitorTest >> testVisitDelegate [
	parser := $a asPParser wrapped.
	result := visitor visit: parser.
	
	self assert: result equals: visitor
]

{ #category : #'as yet unclassified' }
PP2NoopVisitorTest >> testVisitSequence [
	parser := $a asPParser, $b asPParser.
	result := visitor visit: parser.
	
	self assert: result equals: visitor
]
