visiting
visitPP2Node: node
	| transformed transformedChild |
	self isRoot ifTrue: [ self initializeMapping: node ].
		
	transformed := self transformed: node.
	transformed children do: [ :child |
		transformedChild := self visit: child.
		transformed replace: child with: transformedChild.
	].

	^ transformed
