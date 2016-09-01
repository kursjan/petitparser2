comparing
childrenHash: visitedSet
	| hash |
	hash := '' hash.
	self children do: [ :child |
		hash := hash bitXor: (child hash: visitedSet)
	].
	^ hash