*petitparser2-compatibility
convertTo: aPetit2Node
	^ (super convertTo: aPetit2Node)
		child: parser;
		yourself