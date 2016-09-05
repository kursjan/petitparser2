visiting
visitPossesiveRepeating: parser
	| memento elements retval |
	elements := OrderedCollection new.
	memento := currentContext remember.
	
	[ elements size < parser min ] whileTrue: [
		(retval := self visit: parser child) isPetit2Failure ifTrue: [
			currentContext restore: memento.
			"^ PP2Failure message: 'not enough repetitions' context: currentContext."
			^ retval
		].
		elements addLast: retval 
	].
	
	[ elements size < parser max ] whileTrue: [
	 	(retval := self visit: parser child) isPetit2Failure ifTrue: [ 
			^ elements 
		].
		elements addLast: retval 
	].

	^ elements