factory-objects
noneOf: aCollection
	^ self new
		predicate: [ :each | (aCollection includes: each) not ];
		predicateMessage: 'none of ' , aCollection printString , ' expected';
		negated: [ :each | (aCollection includes: each) ];
		negatedMessage: 'any of ' , aCollection printString ,  'expected'