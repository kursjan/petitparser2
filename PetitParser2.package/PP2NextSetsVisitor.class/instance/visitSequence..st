visiting
visitSequence: node
	| oldNext |
	self addAll: currentNext to: node.
	oldNext := currentNext.
		
	node children reversed do: [ :child |
		self visit: child.
		child isNullable ifFalse: [ currentNext := IdentitySet new ].
		currentNext := currentNext copy add: child; yourself
	].

	currentNext := oldNext