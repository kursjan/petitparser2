*PetitParser2-Compatibility
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		literal: literal;
		message: message;
		yourself