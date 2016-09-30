visiting
visitSequence: node
	| oldNext |
	self addAll: currentNext to: node.
	oldNext := currentNext copy.
		
	node children reversed do: [ :child |
		self visit: child.
		child isNullable ifFalse: [ currentNext := OrderedCollection new ].
		currentNext := currentNext copy add: child; yourself
	].

	currentNext := oldNext