parsing
parseOn: context
	| retval startPosition |
	startPosition := context position.
	(retval := node child parseOn: context) isPetit2Failure ifTrue: [  
		^ retval
	].
	
	^ node nodeClass new
		children: (self toCollection: retval);
		startPosition: startPosition + 1;
		stopPosition: context position;
		name: self node nodeName;
		yourself