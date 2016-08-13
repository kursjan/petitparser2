visiting
visitPossesiveRepeating: parser
	| context elements |
	elements := OrderedCollection new.
	
	[ elements size < parser min ] whileTrue: [
		(self visit: parser child) isPetit2Failure ifTrue: [
			^ currentContext failure: 'not enough repetitons' 
		].
		elements addLast: currentContext value 
	].
	
	[ elements size < parser max ] whileTrue: [
		context := currentContext.
	 	(self visit: parser child) isPetitFailure ifTrue: [ 
			^ context success: elements asArray 
		].
		elements addLast: currentContext value 
	].

	^ currentContext success: elements asArray