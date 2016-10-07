parsing
parseOn: context
	| startMemento returnValue |
	startMemento := context remember.
	(returnValue := node child parseOn: context) isPetit2Failure ifTrue: [ ^ returnValue ].

	^ context copy 
		returnValue: returnValue;
		startMemento: startMemento;
		parser: node;
		yourself