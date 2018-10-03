"
I collect all the children that has a name. I do not collect children of those children. For that, you can simply use:

#allNodes select: [:n | n name isNil not ]
"
Class {
	#name : #PP2NamedChildrenVisitor,
	#superclass : #PP2NoopVisitor,
	#category : 'PetitParser2-GUI-Visitors'
}

{ #category : #visiting }
PP2NamedChildrenVisitor >> visitPP2Node: node [
	| retval |
	(self isRoot not and: [ node name isNil not ]) ifTrue: [ 
		^ IdentitySet with: node 
	].

	retval := IdentitySet new.
	node children do: [ :child | retval addAll: (self visit: child) ].
	^ retval
]
