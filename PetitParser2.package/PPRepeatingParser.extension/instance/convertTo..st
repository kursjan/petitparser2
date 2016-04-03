*petitparser2
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		min: min;
		max: max;
		yourself