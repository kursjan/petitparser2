operators
plus
	^ (PP2PossesiveRepeatingParser on: self)
		min: 1;
		yourself