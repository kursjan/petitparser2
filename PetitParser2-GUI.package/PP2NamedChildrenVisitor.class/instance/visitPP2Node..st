as yet unclassified
visitPP2Node: node
	| retval |
	(self isRoot or: [ node name isNil ]) ifFalse: [ 
		^ IdentitySet with: node 
	].

	retval := IdentitySet new.
	node children do: [ :child | retval addAll: (self visit: child) ].
	^ retval