Class {
	#name : #PP2AllNodesVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-Analysis'
}

{ #category : #visiting }
PP2AllNodesVisitor >> allNodes [
	^ closeSet collect: [ :ctx | ctx node ]
]

{ #category : #visiting }
PP2AllNodesVisitor >> children [
	self halt: 'deprecated'.
	^ closeSet collect: [ :ctx | ctx node ]
]

{ #category : #visiting }
PP2AllNodesVisitor >> visitPP2Node: node [
	| retval |
	retval := IdentitySet new.
	node children do: [ :child | 
		retval addAll: (self visit: child)
	].
	retval add: node.
	
	^ retval
]
