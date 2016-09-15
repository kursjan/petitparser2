transforming
getNewMethodName
	parameters isEmpty
		ifFalse: [ self refactoringError: 'Cannot extract production since it contains references.' ].
	targetProduction asSymbol isUnary
		ifFalse: [ self refactoringError: 'Invalid production name.' ].
	^ targetProduction asSymbol