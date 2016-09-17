private building
followIn: aBrowser
	self flag: 'Not yet supported'.
	
	aBrowser list
		title: 'Follow';
		useExplicitNotNil;
		format: [ :parser | parser displayName ];
		display: [ :class :productionSelector | 
			| parser |
			parser := class new.
			parser followSets
				at: (parser productionAt: productionSelector)
				ifAbsent: [ Array with: nil asPParser ] ]