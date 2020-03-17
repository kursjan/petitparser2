"
Matches a virtual character that is at the end of input.

Examples:
#eoi asPParser parse: ''.
#eoi asPParser parse: 'a'.
"
Class {
	#name : #PP2EndOfInputNode,
	#superclass : #PP2Node,
	#category : 'PetitParser2-Nodes'
}

{ #category : #visiting }
PP2EndOfInputNode >> accept: aPP2Visitor [
	^ aPP2Visitor visitEndOfInput: self
]

{ #category : #accessing }
PP2EndOfInputNode >> firstCharSet [
	"
	 Because the end of input is not 'real' character in the input stream,
	 PP2 cannot compare end of input with a peek character.
	"
	^ PP2UnknownCharSetPredicate instance
]

{ #category : #testing }
PP2EndOfInputNode >> isEOI [
	^ true	
]

{ #category : #initialization }
PP2EndOfInputNode >> resetStrategy [
	strategy := PP2EndOfInput on: self
]
