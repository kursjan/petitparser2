factory-objects
anyOf: aCollection
	^ self new
		predicate: [ :each | aCollection includes: each ];
		predicateMessage: 'any of ' , aCollection printString , ' expected';
		negated: [ :each | (aCollection includes: each) not ];
		negatedMessage: 'none of ' , aCollection printString ,  'expected'