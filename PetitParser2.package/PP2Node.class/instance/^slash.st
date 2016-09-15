operators
/ aParser 
	"Answer a new parser that parses the receiver, if the receiver fails try with aParser (ordered-choice)."
	
	^ PP2ChoiceNode with: self with: aParser