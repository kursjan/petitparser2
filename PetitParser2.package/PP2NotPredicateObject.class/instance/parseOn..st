as yet unclassified
parseOn: context
	| peek |
	peek := context peek.
	^ (peek isNil not and: [ predicate value: peek ])
		ifFalse: [ nil ] 
		ifTrue: [ PP2Failure message: 'predicate not expected' context: context ]