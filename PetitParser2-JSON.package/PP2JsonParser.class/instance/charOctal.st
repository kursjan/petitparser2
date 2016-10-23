primitives
charOctal
	^ super charOctal ==> [ :nodes |
		Character value: (nodes last allButFirst
			inject: nodes last first digitValue
			into: [ :result :each | (result << 4) + each digitValue ]) ]