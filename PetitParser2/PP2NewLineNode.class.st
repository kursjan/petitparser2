"
Matches beginning of a line.

Example:
#newline asPParser parse: String cr.
#newline asPParser parse: ''

"
Class {
	#name : #PP2NewLineNode,
	#superclass : #PP2Node,
	#category : #'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2NewLineNode >> accept: visitor [
	^ visitor visitNewLine: self
]

{ #category : #accessing }
PP2NewLineNode >> firstCharSet [
	^ PP2CharSetPredicate on: [ :e | e = Character cr or: [ e = Character lf ] ]
]

{ #category : #initialization }
PP2NewLineNode >> resetStrategy [
	strategy := PP2NewLine on: self
]
