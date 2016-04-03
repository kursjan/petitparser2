*petitparser2-compatibility
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		message: message;
		yourself