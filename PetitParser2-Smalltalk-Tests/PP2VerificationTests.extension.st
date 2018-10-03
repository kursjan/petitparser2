Extension { #name : #PP2VerificationTests }

{ #category : #'*PetitParser2-Smalltalk-Tests-Verification' }
PP2VerificationTests >> testPP2SmalltalkParserOptimizations [
	| validator |
	validator := PP2SmalltalkParserOptimizationsValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.
]
