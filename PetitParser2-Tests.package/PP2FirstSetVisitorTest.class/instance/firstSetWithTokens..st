accessing
firstSetWithTokens: aPP2Node
	^ PP2FirstSetVisitor new 
		terminalBlock: [ :e | e isToken or: [ e isFirstSetTerminal  ] ];
		visit: aPP2Node