*PetitParser2-Compatibility
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		min: min;
		max: max;
		yourself