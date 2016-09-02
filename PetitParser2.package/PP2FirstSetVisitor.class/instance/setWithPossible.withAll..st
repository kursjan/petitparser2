support
setWithPossible: node withAll: aCollection
	| set |
	set := IdentitySet withAll: aCollection.
	
	(predicateBlock value: node) ifTrue: [ 
		set add: node
	].

	^ set