as yet unclassified
testPP2SmalltalkGramamrCompatibility
	| validator |
	validator := PP2SmalltalkGrammarValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.