factory-objects
expect: anObject message: aString
	^ (self new)
		predicate: [ :each | each = anObject ];
		predicateMessage: aString;
		negated: [ :each | each ~= anObject ];
		negatedMessage: 'no ' , aString