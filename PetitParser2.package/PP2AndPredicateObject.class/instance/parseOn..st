as yet unclassified
parseOn: context
	| peek |
	peek := context peek.
	^ (peek isNil not and: [ predicate value: peek ])
		ifTrue: [ peek ] 
		ifFalse: [ PP2Failure message: 'predicate expected' context: context ]