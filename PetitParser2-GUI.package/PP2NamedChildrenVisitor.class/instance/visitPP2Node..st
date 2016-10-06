visiting
visitPP2Node: node
	| retval |
	(self isRoot not and: [ node name isNil not ]) ifTrue: [ 
		^ IdentitySet with: node 
	].

	retval := IdentitySet new.
	node children do: [ :child | retval addAll: (self visit: child) ].
	^ retval