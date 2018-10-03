Class {
	#name : #PP2BypassVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2BypassVisitor >> doPass: node [
	^ self visit: node
]

{ #category : #visiting }
PP2BypassVisitor >> visitComposite: node [
	self visit: node child.
]

{ #category : #visiting }
PP2BypassVisitor >> visitPP2Node: node [
	| target |
	node children do: [ :child | 
		(child class == PP2DelegateNode and: [ child strategy class == PP2Delegate]) ifTrue: [  
			target := child child.
			node strategy bypass: child to: target
		].
		self visit: child.
	]
]
