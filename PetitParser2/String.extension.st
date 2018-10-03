Extension { #name : #String }

{ #category : #'*petitparser2' }
String >> asPParser [
	"Answer a parser that accepts the receiving string."

	^ PP2LiteralSequenceNode on: self
]
