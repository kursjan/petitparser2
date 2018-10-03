Class {
	#name : #PP2ChoiceNode,
	#superclass : #PP2ListNode,
	#category : 'PetitParser2-Nodes'
}

{ #category : #operators }
PP2ChoiceNode >> / aRule [ 
	^ self copyWith: aRule
]

{ #category : #visiting }
PP2ChoiceNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitChoice: self
]

{ #category : #'parsing - private' }
PP2ChoiceNode >> parseOn: aPP2Context [
	^ strategy parseOn: aPP2Context 
]

{ #category : #initialization }
PP2ChoiceNode >> resetStrategy [
	strategy := PP2Choice on: self
]
