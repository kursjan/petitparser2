*petitparser2-compatibility
asPetit2Parser
	^ self transform: [ :parser | parser asPetit2Node ]