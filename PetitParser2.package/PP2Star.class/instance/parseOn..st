as yet unclassified
parseOn: aPP2Context
	| elements retval |
	elements := OrderedCollection new.
	
	node max timesRepeat: [
		(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [
			^ elements asArray
		].
		elements addLast: retval 
	].
	
	^ elements asArray