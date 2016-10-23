accessing
number 
	^ ($- asPParser optional , #digit asPParser plus , ($. asPParser , #digit asPParser plus) optional) token
		==> [ :nodes | nodes first value asNumber ]