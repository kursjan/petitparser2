initialization
reset
	self node changesContext ifTrue: [  
		memoizationStrategy := PP2CSMemoization new.
		buffer := Dictionary new
	] ifFalse: [  
		memoizationStrategy := PP2CFMemoization new.
		buffer := IdentityDictionary new
	]