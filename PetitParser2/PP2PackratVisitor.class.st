Class {
	#name : #PP2PackratVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Optimizations'
}

{ #category : #'as yet unclassified' }
PP2PackratVisitor >> doPass: node [
	^ self visit: node
	
]

{ #category : #visiting }
PP2PackratVisitor >> visitPP2Node: node [
	(node shouldMemoize) ifTrue: [  
		(node contextChanges isContextChange) ifTrue: [  
			node addWarning: 'cannot memoize a node that changes context!'
		] ifFalse: [ 
			node strategy: node strategy memoize
		]
	].
	^ super visitPP2Node: node

]
