grammar
array
	^ super array map: [ :openNode :statementNodes :closeNode |
		(self buildArray: statementNodes)
			left: openNode start;
			right: closeNode start;
			yourself ]