parsing
parseOn: aPP2Context
	| memento elements retval |
	elements := OrderedCollection new.
	memento := aPP2Context remember.
	
	[ elements size < node min ] whileTrue: [
		(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [
			aPP2Context restore: memento.
			^ retval
		].
		elements addLast: retval 
	].
	
	[ elements size < node max ] whileTrue: [
	 	(retval := node child parseOn: aPP2Context) isPetit2Failure ifTrue: [ 
			^ elements 
		].
		elements addLast: retval 
	].

	^ elements