Class {
	#name : #PP2BufferStreamValidatorTest,
	#superclass : #TestCase,
	#instVars : [
		'validator'
	],
	#category : 'PetitParser2-Validation-Tests-Tests'
}

{ #category : #running }
PP2BufferStreamValidatorTest >> setUp [
	super setUp.
	validator := PP2BufferStreamValidator new.

]

{ #category : #tests }
PP2BufferStreamValidatorTest >> testActualForSource [
	| result |
	result := validator actualForSource: '1+2'.
	
	self assert: result size = 3.
	self assert: result first = 1.
	self assert: result second = $+.
	self assert: result third = 2.
]

{ #category : #tests }
PP2BufferStreamValidatorTest >> testActualForSourceSingleNumber [
	| result |
	result := validator actualForSource: '52'.
	
	self assert: result isCollection.
]

{ #category : #tests }
PP2BufferStreamValidatorTest >> testExpectedForSource [
	| result |
	result := validator expectedForSource: '1+2'.
	
	self assert: result size = 3.
	self assert: result first = 1.
	self assert: result second = $+.
	self assert: result third = 2.
]

{ #category : #tests }
PP2BufferStreamValidatorTest >> testExpectedForSourceSingleNumber [
	| result |
	result := validator expectedForSource: '52'.
	
	self assert: result isCollection.
]
