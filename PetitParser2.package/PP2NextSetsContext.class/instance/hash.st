comparing
hash
	| hash |
	hash := super hash.

	currentNext size <= 10 ifTrue: [  
		currentNext do: [ :e | e identityHash ].
	].

	^ hash bitXor: currentNext size hash