Class {
	#name : #PP2AllNodesVisitorTest,
	#superclass : #TestCase,
	#instVars : [
		'children',
		'parser',
		'visitor'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #running }
PP2AllNodesVisitorTest >> setUp [
	visitor := PP2AllNodesVisitor new
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testChoice [
	parser := $a asPParser / $b asPParser.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 3.
	self assert: (children includes: parser).
	self assert: (children includes: parser firstChild).
	self assert: (children includes: parser secondChild).
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testCycle [
	| delegate |
	delegate := PP2DelegateNode new.
	parser := delegate, delegate.
	delegate child: parser.

	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size equals: 2.
	self assert: (children includes: parser).
	self assert: (children includes: delegate).	
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testLiteral [
	parser := $a asPParser.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 1.
	self assert: children anyOne = parser.
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testSequence [
	parser := $a asPParser, $b asPParser.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 3.
	self assert: (children includes: parser).
	self assert: (children includes: parser firstChild).
	self assert: (children includes: parser secondChild).
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testTokenParser [
	parser := $a asPParser token.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 2.
	self assert: (children includes: parser child).
	self assert: (children includes: parser).	
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testTrimParser [
	| trimmer |
	trimmer := PP2FailingNode instance.
	parser := $a asPParser trim: trimmer.
	
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 3.
	self assert: (children includes: parser child).
	self assert: (children includes: parser).
	self assert: (children includes: trimmer).	
]

{ #category : #tests }
PP2AllNodesVisitorTest >> testWrapping [
	parser := $a asPParser wrapped.
	children := self visit: parser.
	
	self assert: children isCollection.
	self assert: children size = 2.
	self assert: (children includes: parser child).
	self assert: (children includes: parser).	
]

{ #category : #running }
PP2AllNodesVisitorTest >> visit: node [
	^ visitor visit: node.

]
