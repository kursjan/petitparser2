initialization
initialize
	super initialize.
	
	waterToken := #any asPParser.
	boundary := (PP2ChoiceNode with: PP2EndOfInputNode new and).