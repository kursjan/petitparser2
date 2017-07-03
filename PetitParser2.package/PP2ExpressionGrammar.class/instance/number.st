tokens
number
	^ ($- asPParser optional , #digit asPParser plus , ($. asPParser, #digit asPParser plus) optional) flatten