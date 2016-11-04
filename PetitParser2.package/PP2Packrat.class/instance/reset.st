accessing
reset
	self node isContextSensitive ifTrue: [  
		memoizationStrategy := PP2CSMemoization new.
		buffer := Dictionary new
	] ifFalse: [  
		memoizationStrategy := PP2CFMemoization new.
		buffer := IdentityDictionary new
	]