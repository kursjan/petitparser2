*petitparser2
convertTo: aPP2Node
	^ (super convertTo: aPP2Node)
		children: parsers copy;
		yourself.