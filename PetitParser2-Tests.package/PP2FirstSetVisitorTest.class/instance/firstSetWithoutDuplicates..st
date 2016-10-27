accessing
firstSetWithoutDuplicates: aPP2Node
	^ self withoutDuplicates: (PP2FirstSetVisitor firstSet visit: aPP2Node)