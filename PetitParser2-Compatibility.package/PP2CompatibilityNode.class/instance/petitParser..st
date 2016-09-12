accessing
petitParser: aPPParser
	self halt: 'deprecated?'.
	self assert: (aPPParser isKindOf: PPParser).
	petitParser := aPPParser