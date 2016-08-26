*PetitParser2-Smalltalk
visitSmalltalkWhitespace: node	
	( currentContext atEnd not and: [ currentContext uncheckedPeek isSeparator ]) ifTrue: [ 
		^ currentContext next 
	].
		
	(currentContext atEnd not and: [ currentContext uncheckedPeek = $" ]) ifTrue: [
		currentContext := currentContext next.
		^ currentContext upTo: $".
	].

	^ currentContext failure: 'no whitespace or comment found'
