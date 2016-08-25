grammar
number
	^ ($- asParser2 optional , #digit asParser2 plus , ($. asParser2, #digit asParser2 plus) optional) flatten trim
