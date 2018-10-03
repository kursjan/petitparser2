Class {
	#name : #PP2ParentAnalysisVisitor,
	#superclass : #PP2NoopVisitor,
	#instVars : [
		'parent'
	],
	#category : 'PetitParser2-Optimizations'
}

{ #category : #optimizations }
PP2ParentAnalysisVisitor >> doPass: node [
	^ self visit: node
	
]

{ #category : #'visiting - utilities' }
PP2ParentAnalysisVisitor >> nodeClosed: node [
	self assert: parent isNil not.
	
	node addParent: parent
]

{ #category : #'visiting - utilities' }
PP2ParentAnalysisVisitor >> nodeOpened: node [
	self assert: parent isNil not.
	
	node addParent: parent
]

{ #category : #visiting }
PP2ParentAnalysisVisitor >> visitPP2Node: node [
	| tmpParent |
	parent isNil ifFalse: [ node addParent: parent ].

	tmpParent := parent.
	parent := node.
	super visitPP2Node: node.
	parent := tmpParent.

]
