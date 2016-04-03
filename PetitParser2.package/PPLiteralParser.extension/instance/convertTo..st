*petitparser2
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		literal: literal;
		message: message;
		yourself