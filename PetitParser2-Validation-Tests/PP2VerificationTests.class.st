"
I am aspecial kind of test. I do not test validation  itself, but that that validation returns expected results.
"
Class {
	#name : #PP2VerificationTests,
	#superclass : #TestCase,
	#category : 'PetitParser2-Validation-Tests-Verification'
}

{ #category : #streams }
PP2VerificationTests >> testPP2BufferStream [
	| validator |
	validator := PP2BufferStreamValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.
]

{ #category : #optimizations }
PP2VerificationTests >> testPP2ExpressionGrammarOptimizations [
	| validator |
	validator := PP2ExpressionGrammarOptimizaitonsValidator new.
	validator validateBlocking.
	
	self assert: validator report precision equals: 1.
	self assert: validator report recall equals: 1.
]
