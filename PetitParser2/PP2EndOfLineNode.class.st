Class {
	#name : #PP2EndOfLineNode,
	#superclass : #PP2Node,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2EndOfLineNode >> accept: visitor [
	^ visitor visitEndOfLine: self
]

{ #category : #accessing }
PP2EndOfLineNode >> firstCharSet [
	^ PP2UnknownCharSetPredicate instance
]

{ #category : #accessing }
PP2EndOfLineNode >> resetStrategy [
	strategy := PP2EndOfLine on: self
]
