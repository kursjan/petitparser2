private utilities
productionSelectorsFrom: class
	^ (((class allInstVarNames copyWithoutAll: class ignoredNames)
		collect: [ :each | each asSymbol ])
			select: [ :each | class includesSelector: each ]) asSortedCollection add: #start; yourself