*PetitParser2-Backtracking
// aParser 
	"Answer a new parser that parses the receiver, if the receiver fails try with aParser (ordered-choice)."
	
	^ PP2BacktrackingChoiceNode with: self with: aParser