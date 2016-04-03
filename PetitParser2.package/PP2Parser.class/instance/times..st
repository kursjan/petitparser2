operators
times: integer
	^ (PP2PossesiveRepeatingParser on: self)
		min: integer;
		max: integer;
		yourself