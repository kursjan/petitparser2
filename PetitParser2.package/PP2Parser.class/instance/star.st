operators
star
	^ (PP2PossesiveRepeatingParser on: self)
		min: 0;
		yourself