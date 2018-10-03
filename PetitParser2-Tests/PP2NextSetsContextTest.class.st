Class {
	#name : #PP2NextSetsContextTest,
	#superclass : #TestCase,
	#instVars : [
		'o1',
		'o2',
		'context1',
		'context2',
		'o3'
	],
	#category : 'PetitParser2-Tests-Analysis'
}

{ #category : #'as yet unclassified' }
PP2NextSetsContextTest >> setUp [
	o1 := Object new.
	o2 := Object new.
	o3 := Object new.
	
	context1 := PP2NextSetsContext new.
	context2 := PP2NextSetsContext new.
]

{ #category : #'as yet unclassified' }
PP2NextSetsContextTest >> testEqual [
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o1).
	
	self deny: context1 == context2.
	self assert: context1 = context2.
]

{ #category : #'as yet unclassified' }
PP2NextSetsContextTest >> testEqualNot [
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o3).
	
	self deny: context1 == context2.
	self deny: context1 = context2.
]

{ #category : #'as yet unclassified' }
PP2NextSetsContextTest >> testHash [
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o1).
	
	self assert: context1 hash equals: context2 hash. 
]

{ #category : #'as yet unclassified' }
PP2NextSetsContextTest >> testHashNotEqual [
	context1 currentNext: (IdentitySet with: o1 with: o2).
	context2 currentNext: (IdentitySet with: o2 with: o1 with: o3).
	
	self deny: context1 hash = context2 hash. 
]
