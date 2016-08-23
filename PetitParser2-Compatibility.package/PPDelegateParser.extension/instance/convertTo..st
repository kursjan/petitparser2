*PetitParser2-Compatibility
convertTo: aPetit2Node
	^ (super convertTo: aPetit2Node)
		child: parser;
		yourself