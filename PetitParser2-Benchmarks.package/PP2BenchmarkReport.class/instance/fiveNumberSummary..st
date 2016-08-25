statistics
fiveNumberSummary: list
	| median min max lowerQuartile upperQuartile |
	median := self median: list.
	min := self min: list.
	max := self max: list.
	lowerQuartile := self lowerQuartile: list.
	upperQuartile := self upperQuartile: list.
	
	^ {  min . lowerQuartile . median . upperQuartile . max } 