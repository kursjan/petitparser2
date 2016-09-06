analysis - first
firstCharSet
	^ self doesFunctionalChanges ifTrue: [ 
		PP2UnknownCharSetPredicate instance
	] ifFalse: [  
		child firstCharSet
	]