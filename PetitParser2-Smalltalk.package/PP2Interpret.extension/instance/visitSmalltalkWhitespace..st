*PetitParser2-Smalltalk
visitSmalltalkWhitespace: node	
	( currentContext atEnd not and: [ currentContext uncheckedPeek isSeparator ]) ifTrue: [ 
		^ currentContext next 
	].
		
	(currentContext atEnd not and: [ currentContext uncheckedPeek = $" ]) ifTrue: [
		currentContext next.
		^ currentContext upTo: $".
	].

	^ PP2Failure message: 'no whitespace or comment found' context: currentContext
