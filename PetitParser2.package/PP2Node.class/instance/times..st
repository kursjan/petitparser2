operators
times: anInteger
	"Answer a new parser that parses the receiver exactly anInteger times."
	
	^ (PP2PossesiveRepeatingNode on: self)
		min: anInteger;
		max: anInteger;
		yourself