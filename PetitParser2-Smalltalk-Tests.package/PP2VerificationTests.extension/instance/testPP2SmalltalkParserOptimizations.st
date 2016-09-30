*PetitParser2-Smalltalk-Tests-Verification
testPP2SmalltalkParserOptimizations
	| validator |
	validator := PP2SmalltalkParserOptimizationsValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.