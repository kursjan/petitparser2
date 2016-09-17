*PetitParser2-Smalltalk
setupRBParser
	
	input := self sourcesFor: 'smalltalk'.
	parser := RBParser new.
	preferredRepetitions := 3.