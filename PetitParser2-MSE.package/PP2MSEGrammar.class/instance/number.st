basic
number
	^ ($- asPParser optional , natural , ($. asPParser , natural , e optional) optional) flatten token trim