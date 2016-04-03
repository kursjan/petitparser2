instance creation
on: predicate message: message
	^ self new
		predicate: predicate;
		predicateMessage: message;
		negated: [ :arg | (predicate value: arg) not ];
		negatedMessage: 'no ', message;
		yourself