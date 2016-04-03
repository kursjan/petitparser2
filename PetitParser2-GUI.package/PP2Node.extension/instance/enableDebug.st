*PetitParser2-GUI
enableDebug
   | root newParser  |
	root := PPParserDebuggerResult new.
	
	"In order to debug island waters, we need to compute the island water..."
	self allParsers select: [ :p | p isKindOf: PPIsland  ] thenDo: [ :island |
		island createWaterForRoot: self	
	].
	
	newParser := self transform: [:each |
		each >=> [:startContext :continuation | 
			| resultContext child |
			child := PPParserDebuggerResult new 
					parser: each;
					parent: root.

			root := child. 
			resultContext := continuation value.
			root := child parent.

 			child start: startContext position + 1.
			child end: resultContext position.
			child result: resultContext value.
			"self halt."
			root children add: child.
			resultContext 
		]
	].
	
	^ PP2DebugParser on: newParser root: root.
