Class {
	#name : #PP2DebugResultTest,
	#superclass : #TestCase,
	#category : 'PetitParser2-Tests-Debug'
}

{ #category : #tests }
PP2DebugResultTest >> testContents [
	| result |
	result := PP2DebugResult new.
	result context: 'a' asPetit2Context.
	
	self assert: result contents equals: 'a'
]

{ #category : #tests }
PP2DebugResultTest >> testStartStopInterval [
	| result |
	result := PP2DebugResult new.
	
	self assert: result startStopInterval isNotNil.
]
