element
elementCF
	^ ((elOpenCF, elContent, elCloseCF)

	==> [ :t | 
		t first = t third ifFalse: [  
			PP2Failure message: 'does not match'
		] ifTrue: [  
			t
		]
	])
		memoize;
		yourself
	