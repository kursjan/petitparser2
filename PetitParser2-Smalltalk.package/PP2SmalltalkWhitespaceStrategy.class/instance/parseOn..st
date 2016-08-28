parsing
parseOn: aPP2Context
	[ aPP2Context atEnd not and: [ aPP2Context uncheckedPeek isSeparator ]] whileTrue: [ 
		^ aPP2Context next 
	].
		
	(aPP2Context atEnd not and: [ aPP2Context uncheckedPeek = $" ]) ifTrue: [
		aPP2Context next.
		^ aPP2Context upTo: $".
	].

	self assert: failure isPetit2Failure.
	^ failure