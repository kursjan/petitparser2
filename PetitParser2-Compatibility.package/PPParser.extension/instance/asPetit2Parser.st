*PetitParser2-Compatibility
asPetit2Parser
	^ self transform: [ :parser | parser asPetit2Node ]